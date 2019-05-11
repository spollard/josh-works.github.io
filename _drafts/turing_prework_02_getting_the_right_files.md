---
layout: post
title:  "Turing Prep Chapter 2: Your first passing tests!"
date:  2019-04-24 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-02-get-the-right-files-and-first-exercise
---


### Index 

- [getting the right files (start here)](#getting-the-right-files)
- [video walk-through of the `strings.rb` test](#6-video-walkthrough---make-the-first-test-pass)
- [video walk-through of the first mythical creature (`unicorn.rb`)](#mythical-creatures-unicornrb)
- [video walk-through of another mythical creature (`dragon.rb`)](#mythical-creatures-dragonrb)
- [troubleshooting various errors you might see](#troubleshooting-errors)

------------------------

A warning - the hours ahead that you spend on this will be chock full of error messages. Embrace googling error messages! When in doubt, google it, even if it's meaningless to you! Somewhere on the internet exists hints and clues about what to do.

This skill set (googling for hints, using those hints to improve your googling, testing those assumptions, not giving up, etc) is known as **technical sophistication**. 

Every time you encounter something unfamiliar, and google your way to an understanding and/or solution, you're building _technical sophistication_. This is a _very_ good thing. 

from: https://www.learnenough.com/command-line-tutorial

> In technology, a similar skill (or, more accurately, set of skills) exists in the form of **technical sophistication**. In addition to “hard skills” like familiarity with text editors and the Unix command line, technical sophistication includes “soft skills” like looking for promising menu items and knowing the kinds of search terms to drop into Google... along with an attitude of doing what it takes to make the machine do our bidding. 
>
> These soft skills, and this attitude, are hard to teach directly, so as you progress through this and subsequent Learn Enough tutorials you should always be on the lookout for opportunities to increase your technical sophistication... Over time, the cumulative effect will be that you’ll have the seemingly magical ability to do everything in every program.

--------------------------

## Getting the right files

Here's all that you'll need to run drills for the next few weeks:

* https://github.com/turingschool/ruby-exercises
* https://github.com/turingschool/enums-exercises

we're going to work through getting set up on this as incrementally as possible.

## 1. clone the repository to your machine

That might be all greek to you. no worries! Open this URL: https://github.com/turingschool/ruby-exercises

click the "clone or download" button:

![clone repo](https://cl.ly/a9940ade2da9/2018-09-19%20at%207.44%20AM.jpg)

<!--more-->

it'll look like either:

- `https://github.com/turingschool/ruby-exercises.git`
- `git@github.com:turingschool/ruby-exercises.git`


It doesn't matter which one you use. You can read more on [the difference between HTTPS and SSH URLs here](https://help.github.com/articles/which-remote-url-should-i-use/)

Now, in your terminal, clone down the repo. We'll use the `git clone` command:

```
$ git clone https://github.com/turingschool/ruby-exercises.git
```

or, if you used the SSH url:

```
$ git clone git@github.com:turingschool/ruby-exercises.git
```


## 2. Find the first exercise

You should be able to see the cloned directory on your machine. If you run `ls` in your terminal, you should see an entry for `ruby-exercises`. 

now, `cd` into that directory:

```
cd ruby-exercises
```

Lets start with heading into `/data-types/strings/`:

```
cd data-types
ls # i usually run `ls` just to see what is in each level of a directory. I'm a curious person.
cd strings
ls
```


When you call `ls` the last time, you should see `README.md` and `strings.rb`. If so, you made it! 

If not, `cd` up a level or two, and look around again. (To change directories _up_, you can do `cd ..`
  
## 3. open everything in Atom

now we'll open everything in Atom: 

```
$ atom .
```

Click the `README` file, and read it. 

(if you have problems opening atom, read [below](#cannot-open-atom-from-the-terminal)

## 4. run the file in your terminal. Resolve any error messages

run the file, in your editor, with:

```
$ ruby strings.rb
```

You might get an error like this. (I've highlighted the relevant pieces of the error. The first highlight shows where in the file we ran into the problem, and it's line 3 of the `strings.rb` file. 

The second highlight says "cannot load the thing required in line 3".

![pry missing](https://cl.ly/b2720cede2a5/2018-09-19%20at%207.54%20AM.jpg)

Now, take a look at line three of `strings.rb`:

![line 3](https://cl.ly/1569f3e9027c/2018-09-19%20at%208.03%20AM.jpg)

that's a gem we need. 

If you don't get this error, great! You already have `pry` on your machine, and you can skip the next section.

### What the heck is a ruby gem

A "gem" is just a little bundle of code that interacts with Ruby. 

[here's a rather verbose description of what gems are.](https://en.wikipedia.org/wiki/RubyGems)

And, since we need to install the `pry` gem, we can look it up and see what it does. I googled `ruby gem pry` and clicked the first result, which brought me to: https://github.com/pry/pry

Feel free to read the docs, and get a feel for what Pry can do for you.

Anyway, install the Pry gem with:

```
$ gem install pry
```

If you want to see all of the gems installed on your computer already, you can run:

```
gem list
```

You can read more about [the `gem` command here](https://guides.rubygems.org/rubygems-basics/)

# minitest time

See the references to `minitest` at the top of the file? `minitest/autorun` and `minitest/pride`?

This are "modules" of the `minitest` gem. 

I _strongly_ recommend "pausing" this guide and reading (and re-reading, and write all the code from all the examples in) this _excellent_ guide: https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest

I'll state that again. Read and study the minitest guide. It is _fantastic_ and will set you up for success for the rest of Turing:

https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest

-------------------------------------------------

Did you read the launchschool post? Great! Then most of what is in this file should look a lot more readable to you.

As a quick test, answer the following questions:

- What is minitest?
- what is a Domain-Specific Language (DSL)?
- What does `assert_equal` mean? How many arguments does it expect?
- Will `assert_equal true, "true"` pass? 
- How do you "run" a test file?
- is a "failing" test a bad thing?
- does minitest run all the tests in order?
- Find a list of minitest assertions (google it!). What's a cool one you found?

Awesome. If you can answer all of those questions, you've got your head wrapped around Minitest. Onward!

------------------------------------------------------

## 5. run the file again, get a bunch of `SSSSSSSSS` printed out

this is the error code, then resolving it by installing the pry gem, and then the successful results of running the file:

Wahoo! If you see a long string of `SSSSSSSSS`, you're doing great.

Here's what minitest results mean:

- `S` means "skip", and it means we "skipped" the test. (see all the words inside each method, that say "skip"? that's how we skip that test.)
- `E` means "error". the test couldn't run for some reason.
- `F` means "failure". the test ran, but didn't pass.
- `.` means "success". The test ran, and passed.

So, lets make the first test pass.

## 6. Video Walkthrough of `strings.rb`

Here's a video walkthrough of making the tests pass. Might be useful!

Once you get the hang of it, try pausing the video and keep going on your own. Then unpause the video, compare the results, repeat. (But please do watch the video, at least this little section on using Pry from inside your tests: https://www.youtube.com/watch?v=BKqo2w0W7S0&t=654s)

[![Play the video][image0]][hyperlink0]

  [hyperlink0]: https://www.youtube.com/watch?v=BKqo2w0W7S0
  [image0]: https://cl.ly/8aa0af1b207b/2018-09-28%20at%2011.02%20PM.jpg (Play the video)

Go ahead and finish this file, and then the other files in the same directory. (hashes, arrays, etc.)
