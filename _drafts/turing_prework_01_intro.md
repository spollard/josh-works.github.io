---
layout: post
title:  "Make mod 1 easier than it otherwise would be: a guide"
date:  2019-04-24 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, prework]
permalink: perma_link
---


# Make mod 1 easier than it otherwise would be: a guide

This guide will make Turing's mod 1 _much_ easier than it otherwise would be.

We'll do this by working on, (and completing) a few dozen small Ruby exercises. 

You might be thinking: 
> Josh. This already sounds like a lot of work. I just finished my prework, and I know Turing's gonna be brutal. Why should I do all of this _optional_ work, instead of enjoying my last few days of freedom?

Good question. The answer is a digression into the topics of:
- lumberjacks
- how to learn hard things
- why you should do drills 


## Driving Screws

If I handed you a `spax` screw, and told you I'd pay you $1000 to screw it into a piece of wood, and then handed you a Phillips screw driver, what would you do?

Spax screws look like this: 

![spax](https://cl.ly/11ed020f857c/spax.jpg)

A philips screw bit looks like this:

![philips bit](https://www.irwin.com/uploads/products/large/phillips-head-power-bits-196.jpg)

Philips bits are for driving philips screws, which look like this:

![philips screw](http://ombagroups.com/images/stories/virtuemart/product/Flat-Head-Thread-Forming-Screws-Type-F.gif)

<!--more-->
So, can you drive a spax screw with a philips bit? 

Not easily. 

You could try really hard, use great effort, and end up damaging both the screw driver bit _and_ the screw, and probably barely get a single screw in. I bet, though, that you could get a single screw partially embedded in the wood. 

What if I were to pay you $1000 _per screw_ you could drive into the wood? 

Now you can't rely on just herculean effort, sleepless nights, and tenacity. 

_you have to have the spax bit to drive a spax screw._

For $1000 per screw, you could afford to buy the correct bit, and it would let you _effortlessly_ drive the screws. 

I'd argue it would be _irresponsible to not get the right tools_. 

The analogy should be clear - you're not being asked to drive screws, you're being asked to learn challenging and technical skills. Most of us didn't learn how to learn hard things in school, we figured out how to game the system and squeak by. (Or, we didn't learn to game the system and we didn't squeak by. Did anyone else pick up some failing grades in high school and college. No? Just me? OK.)

You need to learn software development, and you're probably going to put a lot of time and money into this goal.

*It could be considered irresponsible to not acquire the right kinds of tools for learning technical topics*

Obviously, you need the right physical tools. A laptop, functioning screen, etc. But to learn hard things, you need the right mental tools. 

## How to learn hard things

To learn hard things, you need the right mental tools. 

I strongly recommend buying or renting a copy of [A Mind for Numbers: How to Excel at Math and Science (Even If You Flunked Algebra)](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers). 

Do that, but then read these two summaries of the book:

- [Faster to Master: Book Summary: “A Mind For Numbers”, Barbara Oakley](https://fastertomaster.com/a-mind-for-numbers-barbara-oakley/)
- [Karl Booklover: A mind for numbers — Summary](https://www.karlbooklover.com/a-mind-for-numbers-summary/)

_A Mind for Numbers_ talks about how to learn hard things. The author talks about mental models, "chunking" information to free up working memory, practice, drills, repetition, staying the right amount out of your comfort zone, doing hard things, avoiding distraction, procrastination, etc. 

Everything in that book is relevant to the rest of your career in software. Please read the book.

Now, I know most of you will not read the book, despite my strong suggestion and humble request that you do so. That's fine, I guess. 

If you're not going to read the book, you don't get to question my methodology for the rest of this guide. 

To learn hard things, you need to build mental models of the hard thing, and you need practice and repetition. 

Most of the world is on board with the value of "drilling" important things. Fire drills, drills for sports teams, drilling to practice something you'll be tested on - all of these are ways to make sure not only that you know how to do the right thing, but _you can't get it wrong_. 

So, working through these drills will move you in the same direction. You'll not just build a single class (in the mythical creatures), but you'll eventually do it so many times you can't help but get it right every time. 

This will make the rest of your time at Turing go much, much better. It could help save you from repeating a module (six weeks saved, plus a few thousand dollars), and will serve you for the rest of your career as a developer. (Over a decade or two, we're talking about many hundreds of thousands of dollars.)

But don't take my word for it. 

### Feedback from Turing students


##### As a result of doing all these drills:


>  I definitely feel over prepared in some aspects, but I'm trying to use it to help everyone get to the same levels of understanding


> It has been amazing and I feel like I learned so much from mythical_creatures...
>
> The mythical_creatures felt like it like brought everything together and how it works (on a kindergarten level) but made it all feel...real-ish in a way, and that was huge.


>  i swear to god, knowing what pry was and having done mythical creatures helped me so much here!

##### From those who did _not_ do the drills:

> I wish I’d done mythical creatures and more before. I really struggled in mod 1

### Why are drills effective?

Lots of reasons. If you want to get into the nitty gritty, know that they line up closely with the principles of [Deliberate Practice](https://jamesclear.com/deliberate-practice-theory) which is... how anyone can learn anything.

Finally, to make progress in drills, you'll have to get good at examining your own assumptions about what your code is doing, while getting deep into your IRB or Pry prompt. 

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

## Mythical Creatures: `unicorn.rb`

Once you've finished the above exercises... you may want to take a spin at the imfamous mythical creatures! Dun Dun Dun....

They make use of "object oriented" programming. All that means is you will define an object (like a `Person` object) and create instances of that object that have certain behaviors and methods of interaction. 

This is a lot to wrap your head around, and "object oriented programming" is a topic that fills dozens of books, hundreds of conference talks, and you'll spend the rest of your life building a better understanding of. So don't feel any rush to grasp it all in the next ten minutes.

Start with this guide: https://launchschool.com/books/oo_ruby/read/the_object_model

Read it carefully, but don't worry that it all won't make sense. Take notes, run the code examples. Take an hour on it. When you've gone through it once, tackle the first mythical creature.

It can be tricky getting set up, so here's another video of the very first mythical creature:

A quick aside - as you work through these exercises, and all of the exercises to come, you'll perhaps notice a constant tension between "results" vs. "process". Here's what I mean by this, explained in a conversation with a Turing student, working through this exact guide:

They said:
>  [...] In other words, there is more than one way to achieve the result, so do I focus on process or product?  I am not expecting there to be a single “right” answer, but I am curious as to how Turing is going to evaluate us.  Are the steps used more important than the outcome?

I responded with:

> Your intuition is leading you well - the steps _and_ the outcome, are important.
>
> I'd recommend de-emphasizing the Turing evaluations in your mind, though, and just focusing on building the right kind of skills that will serve you well for the rest of your career as a developer. And, from that lens, there will _always_ be tension between
>> the best I know how to do _right now_
> and
>> the best that can be done, ever
>
> Obviously, as you grow your skill-set as a developer, you would be able to go back and improve prior bits of code you've written. It's rare to crank out a "perfect" project, no matter how small.
>
> So, optimize for learning, which basically means... when you find something that works, use it, but next time you come across a similar kind of challenge, you might use something slightly different.
> I don't know if any of this makes sense. It basically means
>> don't sweat not getting exposed to every single ruby method, but be open to using new ones as situations arise, and you get more comfortable with the ones you know.

Or, in summary:
> There may be multiple ways to achieve the required outcome; use what you now know; be on the lookout for other methods that achieve the same result.
 
[![Play the video][image1]][hyperlink1]

  [hyperlink1]: https://www.youtube.com/watch?v=mocwGsu41yw&feature=youtu.be
  [image1]: https://cl.ly/6999b5567673/2018-09-21%20at%2012.34%20AM.jpg (play the video)

Feel free to rely heavily on my solution here in the video, but when you're done making it pass the first time, you _must_ delete all the code (and the file containing the code), and do the exercise a second time, from scratch.

If you don't, you will get maybe 10% of the learning out of this exercise that you should. I made this video not to give you the solution, but to help you get the shape of running the drills. Now that you know the shape (from the video) you can do the drills, but you must re-build `unicorn.rb`, if you made it pass while watching my guide.

Once you've re-built your own `Unicorn` class, re-read the Object-Oriented guide: https://launchschool.com/books/oo_ruby/read/the_object_model

Much more of it will make sense to you this time. 

## Mythical creatures, `dragon.rb`

We're doing another Mythical Creature - this time, `dragon.rb`. I'll get a bit deeper into using Pry, as well as opening with a very minor (but very important!) Terminal modification.

[![Play the video][image2]][hyperlink2]

  [hyperlink2]: https://www.youtube.com/watch?v=NIPerY-xuCk&t
  [image2]: https://cl.ly/6f318d1c0f38/2018-09-24%20at%2010.38%20PM.jpg (Play the video)
  
  
We discuss: 

- Setting new tabs/windows in Terminal to open from current directory. ([more on this](https://apple.stackexchange.com/questions/178017/new-terminal-to-same-directory))
- Atom split panes ([more](https://flight-manual.atom.io/using-atom/sections/panes/))
- Atom Autosave package: It's in your editor by default. [here's how to turn it on](https://stackoverflow.com/questions/29902834/auto-save-in-atom-editor)
- Atom package that shows current indentation: (vertical white lines) [indent-guide-improved](https://atom.io/packages/indent-guide-improved)
- Atom package that highlights beginning/end of method: [ruby-block](https://atom.io/packages/ruby-block)
- Atom package that highlightes all instances of selected text: [highlight-selected](https://atom.io/packages/highlight-selected)
- discussion about how to run just a single test in minitest: https://stackoverflow.com/a/9310490/3210178
- how to run just a single test at a time from the command line
- calling `self` inside of pry, to see the current object under test. 

--------------------------------------------------


# Mythical creatures, `hobbit.rb`

The `hobbit` mythical creature is a bit tricky. We have to start _doing things_ with methods, without necessarily _returning_ anything. Then we have to "interrogate" the object under test to see what has changed, and if some things have changed in a certain way, we do one thing, if not, another.



[![Play the video][image3]][hyperlink3]

  [hyperlink3]: https://www.youtube.com/watch?v=uYGS-DCNR-0
  [image3]: https://cl.ly/f77bd736bbcc/2018-10-23%20at%205.46%20PM.jpg (Play the video)




IF YOU HAVE QUESTIONS! Please leave a comment in this gist. I'll make sure to integrate answers to your questions into this guide.

-----------------------------------

## troubleshooting errors

As you run into problems (and others) let me know. I'd like to collect a broad swath of the errors folks run into, and the solutions, so they don't get too caught up.

## `Traceback... cannot load such file -- pry`

This seems like an intimidating error message at first. 

It's not. The error just says:

> Dear user, you've asked me to import code to run these tests, but I cannot find the code you require. 
>
> The code I was looking for (and cannot find) is called `pry`

Pry is an amazing tool. You'll soon come to love it. In the mean time, just install it. It's a ruby "gem" so you use the `gem install <gem_name>` command.

In your terminal, run `gem install pry` and then run the tests again. 

## Cannot open atom from the terminal

#### Install Atom Shell Commands

Atom makes it super easy to do this:

![install shell commands](https://cl.ly/c774fbf6ae66/2018-09-14%20at%203.44%20PM.jpg)

#### `FSPathMakeRef` and a bunch of other stuff

Here's an error one student saw:

`FSPathMakeRef(/Applications/Atom.app) failed with error -36.`

Googling around lead here: https://github.com/atom/atom/issues/5222

One possible cause was the user's machine had two instances of `Atom.app` on it. (In this case, one was in the `Downloads` folder, the other in `Applications`. Delete one of them, try again.






### Additional resources
 - http://tutorials.jumpstartlab.com/academy/workshops/objects_and_methods.html (companion piece to some of the above guides)
 - https://launchschool.com/books/oo_ruby/read/the_object_model
 - https://launchschool.com/blog/assert-yourself-an-introduction-to-minitest
 - [another one of my gists: terminal command summaries, tab-complete git branches, and a better terminal prompt (with video)](https://gist.github.com/josh-works/7f2e6c82d22dca6e9fbc029c8b17703d)

