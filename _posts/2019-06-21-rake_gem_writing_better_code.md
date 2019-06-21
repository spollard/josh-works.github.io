---
layout: post
title:  "Deliberate Practice in Programming with Avdi Grimm and the Rake gem"
date:  2019-06-21 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, deliberate_practice]
permalink: deliberate-practice-avdi-grimm-rake-gem
---

I've had the concept of Deliberate Practice stuck in my head for a while. 

I want to improve at things (all the things!) in general, but writing and reading code, specifically. Writing and reading code is germane to my primary occupation (software developer) and drives most of my effectiveness on my team. 

If there are two people, one who knows more about something, and one who knows less, but the person who knows less is learning new things _faster_ than the other person, in short order, they'll switch places. 

This concept comes from John Ousterhout, and his talk at Stanford about how [the slope is more important than y-intercept]( {{ site.baseurl }}{% link _posts/2015-06-26-2015-6-25-a-little-bit-of-slope-makes-up-for-a-lot-of-y-intercept.md %}). 

 ![slope and intercept](/squarespace_images/static_556694eee4b0f4ca9cd56729_56035dbbe4b07ebf58d79d16_558ca9b4e4b0391692169928_1435281858196_y-intercept.pngy-intercept_)

I know how to write the code I know how to write; I don't know how to write _better_ code than that. So, I'm taking advantage of code written by people who are _really good at what they do_, and I'm modeling my code after them.

## Deliberate Practice

I'm trying to apply the principles of [deliberate practice](https://fs.blog/2012/07/what-is-deliberate-practice/) to writing code. 

Eric Anders coined the term **Deliberate Practice**, and it boils down to four components:

1. You must be motivated to attend to the task and exert effort to improve your performance.
2. The design of the task should take into account your pre-existing knowledge so that the task can be correctly understood after a brief period of instruction.
3. You should receive immediate informative feedback and knowledge of results of your performance.
4. You should repeatedly perform the same or similar tasks. 

<!--more-->

If this is curious to you, read [Peak: Secrets from the New Science of Expertise](https://www.goodreads.com/book/show/26312997-peak?from_search=true). 

Programming is tricky to parse apart and apply elements of deliberate practice. 


## Deliberate Practice applied to programming

The hardest part (in my opinion) is **getting immediate informative feedback** and **repeating the same/similar tasks**. Usually, while working, once I complete a task, I move on to the next one. I don't get feedback on it, nor do I repeat it. 

So, it's difficult to exercise the "deliberate practice" muscles _while working_. I wanted to find an effective means of getting feedback and getting repetition.

So, I scheduled a [rubber ducking](https://avdi.codes/duck/) session with Avdi Grimm, brought him this problem and told him some solutions I had.

My proposed solution was to find "good code" in an open-source gem that is well tested, delete the file, break the tests, and re-build the file until the tests pass.

He thought it was a great idea, so that's what we did. We worked through the [Rake gem](https://github.com/ruby/rake), specifically the `FileList` class. ([`FileList` on github](https://github.com/ruby/rake/blob/master/lib/rake/file_list.rb)) 

Here's some of what we worked on:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">In a recent Rubber Duck session, <a href="https://twitter.com/josh_works?ref_src=twsrc%5Etfw">@josh_works</a> proposed the novel idea of practicing code skills by deleting a class from an open-source codebase and re-implementing it using the tests as a guide. He generously agreed to let me share the video! <a href="https://t.co/4HQNrtsHnU">https://t.co/4HQNrtsHnU</a></p>&mdash; Avdi Grimm (@avdi) <a href="https://twitter.com/avdi/status/1128359573147004930?ref_src=twsrc%5Etfw">May 14, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

This was great, and I've been working through re-implementing this class, slowly, on my own time.

It's a great way to encounter novel/new patterns for approaching problems. For example, [this block](https://github.com/ruby/rake/blob/master/lib/rake/file_list.rb#L64-L84) of code has consumed a bit of time, as I've fully unpacked it and worked with the underlying concepts:

```ruby
DELEGATING_METHODS.each do |sym|
  if SPECIAL_RETURN.include?(sym)
    ln = __LINE__ + 1
    class_eval %{
      def #{sym}(*args, &block)
        resolve
        result = @items.send(:#{sym}, *args, &block)
        self.class.new.import(result)
      end
    }, __FILE__, ln
  else
    ln = __LINE__ + 1
    class_eval %{
      def #{sym}(*args, &block)
        resolve
        result = @items.send(:#{sym}, *args, &block)
        result.object_id == @items.object_id ? self : result
      end
    }, __FILE__, ln
  end
end
```

We've got a few things happening:

- `Module#class_eval` ([docs](https://ruby-doc.org/core-2.6.3/Module.html#method-i-class_eval))
- `Object#__LINE__` ([docs](https://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-__LINE__))
- `Object#__FILE__` ([docs](https://ruby-doc.org/docs/keywords/1.9/Object.html#method-i-__FILE__))
- blocks and Procs
- `Object#send` ([docs](https://ruby-doc.org/core-2.6.3/Object.html#method-i-send))

This _single each block_ is walking me through metaprogramming, and other bits of ways of using Ruby that are currently ways I use it now. 

This blog post, and subsequent posts, will be unpacking exactly what's going on. I want to learn via deliberate practice, and I learn by documenting what I'm learning. Often I refer back to these posts later, so they serve as references and guides for future-Josh. 

# What does `class_eval` do?

Lets look at the first `class_eval` call:

```ruby
ln = __LINE__ + 1
class_eval %{
  def #{sym}(*args, &block)
    resolve
    result = @items.send(:#{sym}, *args, &block)
    self.class.new.import(result)
  end
}, __FILE__, ln
```

We can see in [the docs](https://ruby-doc.org/core-2.6.3/Module.html#method-i-class_eval) that `class_eval` can take three arguments (or a block, but we'll get there later):

```
class_eval(string [, filename [, lineno]]) -> obj
```

## `__FILE__` and `__LINE__`

a quick hunt around and some Pry sessions reveals that `__LINE__` and `__FILE__` are to help give informative error messages, as they help the program find it's current location in terms of file_name and line_number 

```ruby
__LINE__
=> 45
__FILE__
=> "(pry)"
File.expand_path(__FILE__)
=> "/Users/joshthompson/josh-works.github.io/(pry)"
```

So, with this information, you could have something printed like 
```
/Users/joshthompson/josh-works.github.io/(pry):45
```

which looks suspiciously like how error messages are formatted in stack traces. Here's an error I got yesterday:

```
[73861] ! Unable to load application: NoMethodError: undefined method `=~' for #<Pathname:0x00007f89cf9eb6e0>
/Users/joshthompson/.rvm/gems/ruby-2.4.4/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/dependencies_patch.rb:109:in `load_path_to_real_path': undefined method `=~' for #<Pathname:0x00007f89cf9eb6e0> (NoMethodError)
	from /Users/joshthompson/.rvm/gems/ruby-2.4.4/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/loadable_patch.rb:8:in `load'
```

I have no doubt this stack trace makes great use of `File.expand_path(__FILE__)` and `__LINE__` to build up these errors. 

If you're curious, I clobbered an ugly hotfix in like so:

```ruby
# /Users/joshthompson/.rvm/gems/ruby-2.4.4/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/dependencies_patch.rb:105
def load_path_to_real_path(path)
  # below line added by Josh, it's 💩, remove ASAP
  path = path.to_s if path.class == Pathname
  expanded_path = File.expand_path(path)
  expanded_path << '.rb' unless path =~ /\.r(?:b|ake)\Z/
  expanded_path
end
```

So, with the `__FILE__` and `__LINE__` arguments now understood, back to the `class_eval` method's first argument, `string`.

## `class_eval(string, filename, line_number)`


I worked through [this post](https://dalibornasevic.com/posts/16-ruby-class_eval-__file__-and-__line__-arguments) about class_eval, and worked with the [docs](https://ruby-doc.org/core-2.6.3/Module.html#method-i-class_eval) on the same. 

It's reasonably straight forward. We're just writing a new method definition, that is created at run-time. 

If I stick a pry in the block, and then just copy-paste the contents within the `%{}`, I can see what is happening:

Note the pry, and what I copied-pasted:

![class_eval](/images/2019-06-21_deliberate_practice_01.jpg)


It looks a bit difficult to read at first:


![class_eval_string](/images/2019-06-21_deliberate_practice_02.jpg)

but when we `puts foo`, it cleans right up:


![class_eval_puts](/images/2019-06-21_deliberate_practice_03.jpg)

So, `class_eval` simply lets us define new classes at runtime. 

In this particular block, `sym` was equal to `&`; if we `continue` through the list a few more times, we can find a `class_eval` with `sym` equal to `collect`. What do you think the method definition _there_ will be?

If you guessed `def collect`, you're following how this works!

![class_eval_puts](/images/2019-06-21_deliberate_practice_04.jpg)


So, this last evaluation of `class_eval` results in a method like so:

```ruby
def collect(*args, &block)
  resolve
  result = @items.send(:collect, *args, &block)
  self.class.new.import(result)
end
```

# `&block`, Blocks

That `&block`, I see everywhere. 

Cracking open my copy of [Metaprogramming Ruby 2: Program Like the Ruby Pros (Facets of Ruby)](https://www.amazon.com/Metaprogramming-Ruby-Program-Like-Facets/dp/1941222129), I took my first pass through this topic a while ago, during which I wrote [Blocks and Closures in Ruby]({{ site.baseurl }}{% link _posts/2017-09-27-blocks_and_closures_in_ruby.md %}).

Paolo Perrotta describes the `&` operator, in the context of blocks:

> A block is like an additional, anonymous argument to a method. In most cases, you execute the block right there in the method, using _yield_. In two cases, `yield` is not enough:
> 
> - You want to pass the block to another method (or even another block)
> - You want to convert the block to a _Proc_
> 
> In both cases, you need to point at the block and say, "I want to use _this_ block" --to do that, you need a name. To attach a binding to the block, you can add one special argument to the method. This argument must be the last in the list of arguments and prefixed by an `&` sign. 

`&` is shorthand for calling `to_proc` on whatever it's bound to, I think.

OK, I'm not going to get too bogged down in this code just yet. I've got enough of an understanding that I can move forward, for now, on making this classes' test pass.

More to come soon. 
