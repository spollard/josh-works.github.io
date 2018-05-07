---
layout: post
title:  "Pry Tips and Tricks"
date:  2018-05-07 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [ruby, rails, programming, wombat_security]
permalink: pry-tips-and-tricks
---

_the following is cross-posted from [development.wombatsecurity.com](http://development.wombatsecurity.com/development/2018/05/04/pry-tips-tricks/). I wrote about some handy extra features I've found using Pry much of my day._

I joined the Wombat team a few months ago, and have been working on the [threatsim](https://www.wombatsecurity.com/products/threatsim-how-it-works) product. We had a bit of a bug backlog, and myself and others have been rapidly whipping it into shape.

[ThreatSim](https://www.wombatsecurity.com/products/threatsim-how-it-works) is a Ruby on Rails application; any developer out there who works with Rails has probably used [Pry](https://github.com/pry/pry) extensively in debugging their application. Pry "pauses" your application's execution and lets you observe and manipulate state, wherever the pry happens to be.

Most pry usage is pretty simple - put a pry in your code, cause that line of code to be executed, and then poke around in the session in your terminal.

For me, this can feel unwieldy when I am trying to do a broad examination of the application. Pry is great at showing me the state of the variables contained within the method that the Pry was placed at, but I don't always want to see just this code and its variables, I want to skip around the application and peek into different components.


## Looking at methods

You can use `show-method` to reveal pretty much any code in your application. If you use `show-method` with no arguments, it will show all of the code in the method that you've placed the pry.

For example:

`show-method` (with no arguments, shows current class/method location, can be similar to `whereami` (look at prompt) (I usually append `-l` to `show-method`, to add line numbers

<!--more-->

```ruby
<CookiesController:0x00007f9156c57670>:0> show-method -l

From: /full/path/to/file.rb @ line 78:
Owner: CookiesController
Visibility: private
Number of lines: 37

 78: def load_cookie_jar
 79:   cookies[:tasty] = true
 80:   count = count_cookies
 81:   .
       .
       lots of other code here
       .
       .

111:   require "pry"; binding.pry
112:
113:   Repo::FakeClass::NotActuallyAModule.do_something(options)
114: end
```

See that the line about to be executed (line 113)? What if you want to see what that method is, without jumping into your code editor?


If you want to see what that method is, it's easy! Use `show-method`

```ruby
<CookiesController:0x00007f9156c57670>:0> show-method Repo::FakeClass::NotActuallyAModule.do_something -l

From: full/path/to/file.rvb @ line 165:
Owner: #<Class:Repo::FakeClass::NotActuallyAModule>
Visibility: public
Number of lines: 22

165: def do_something(options = {})
166:   cookies_type = options.fetch(:cookie_type)
167:   is_tasty?      = options.fetch(:is_valid, false)
168:
169:   if is_tasty?
170:     log_it "load_cookies", "is_tasty"
171:     options[:consumed] = nil
172:     options[:pairs_with] = ""
173:
174:     
       .
       .
       .
185:   end
186: end
```

(I'm still adding `-l` to force line-numbers to be printed out.

_[more about `show-source` from Pry](https://github.com/pry/pry#code-browsing)_

## Where was I?

Sometimes, I go so far down a rabbit hole of digging around in Pry, I forget where the `binding.pry` actually is, and what I was trying to do in the first place. (Or I have a few conditional `binding.pry` statements, and I don't recall which one got hit)

Enter `whereami`

This command simply prints out the code surrounding the current `binding.pry`. It's run by default as soon as you hit the pry, which is how you can quickly get your bearings.

_[from the pry docs: whereami](https://github.com/pry/pry/wiki/Runtime-invocation#Whereami)_

## View stack traces

What was that stack trace from the last exception you saw?

`wtf` puts said stack trace:

```shell
<CookiesController:0x00007f9156c57670>:0> not_a_variable
NameError: undefined local variable or method `not_a_variable' for #<CookiesController:0x00007f9156c57670>
from (pry):16:in `load_cookie_jar'
```

and then, anytime later, call `wtf` in pry:

```shell
<CookiesController:0x00007f9156c57670>:0> wtf
Exception: NameError: undefined local variable or method `not_a_variable' for #<CookiesController:0x00007f9156c57670>
--
0: (pry):16:in `load_live_action'
1: /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/pry-0.10.3/lib/pry/pry_instance.rb:355:in `eval'
2: /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/pry-0.10.3/lib/pry/pry_instance.rb:355:in `evaluate_ruby'
3: /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/pry-0.10.3/lib/pry/pry_instance.rb:323:in `handle_line'
4: /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/pry-0.10.3/lib/pry/pry_instance.rb:243:in `block (2 levels) in eval'
```

_[more about `wtf` in Pry](https://github.com/pry/pry/wiki/Exceptions#wtf)_

## Breakpoints in Pry

What about when looking around the state of your application, you decide you want to examine in pry a different method?

Using `show-source <method_name>` doesn't let you interact with the method.

Enter breakpoints. Just like with javascript in the browser, you can add/remove breakpoints to your code with Pry. You don't have to exit the session, jump to the new method, and add a `binding.pry` to it.

You'll need to add [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) to your Gemfile.

With Pry-byebug, breakpoint functionality is fairly straightforward:

- `break` shows all current breakpoints. (this list should be empty if you're running `break` for the first time.
- `break <Class#method>` adds a breakpoint to the start of the given method.

if you add a breakpoint, and call `break` you'll see something like:

```shell

  # Enabled At
  -------------

  1 Yes     Threatsim::LandingPage::GuidLoader.find_guid
```

Remove the first breakpoint with `break --delete 1`

`break --help` is a fruitful summary of what breakpoint-related methods are available to you.

_[more about breakpoints in Pry](https://github.com/deivid-rodriguez/pry-byebug#breakpoints)_



## Calling all callers

Ever wanted to see what called the code that hit your breakpoint?

I sure have!

As usual, Stack Overflow has [a most helpful answer](https://stackoverflow.com/a/21620257/3210178).

You can just call `caller` in pry, to get a full list everything involved in the current stack.

The author of the post points out that you immediately get a giant array of mostly irrelevant items, and suggests filtering by keyword, using a one-liner like so:

`caller.select {|line| line.include? "current_repo_name" }`

Or, alternatively:

`caller.reject { |l| l[".rvm/gems"] }`




### Additional reading, or articles that helped me learn more about Pry:

- [Pry 102: Advanced Features](http://jonathan-jackson.net/2012/05/03/pry-session-102)
- [Pry Cheat Sheet](https://gist.github.com/lfender6445/9919357)
