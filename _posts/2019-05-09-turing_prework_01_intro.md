---
layout: post
title:  "Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be"
date:  2019-05-09 06:00:00 -0700
crosspost_to_medium: true
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-01-intro
---

This is the first of a several-part series. I'm converting [this gist](https://gist.github.com/josh-works/ac68a974cb9e0d73d663ea6c8cf3e8d8) into a series of pages, cleaning up the formatting, making it a bit more bite-sized and re-doing/adding some video walk-throughs. 

If you're impatient with the pace at which this guide is being published, read the above gist. Otherwise, sit tight and I'll publish the rest soon.

This guide is a work-in-progress, so I hope you will reach out if you get stuck on anything. I'm in the Turing slack as `@josh_t`, or ping me via email at `thompsonjoshd` + google's popular email service. Or, get your Github practice on by [opening an issue](https://github.com/josh-works/josh-works.github.io/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) on the Github repo that backs this website. 

If you are working through this guide, and have a problem/hit a snag/get stuck/get really frustrated _I'd like to hear from you_. 

I intend for this series to started _after_ finishing Turing's [Mod 0 program](http://mod0.turing.io/capstone/be_engineering/) and [Mod 0 capstone](https://github.com/turingschool-examples/module_0_capstone)

If you don't have enough time to work through these resources, no problem. Don't work through it. This is simply a guide to make Turing _a little easier than it otherwise will be_. Most Turing students have done just fine without these resources. 

### Index of this series:
- [**Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be**]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %}) (This is what you're reading right now)
- [Turing Prep Chapter 2: Your first passing tests!]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %}) 
- [Turing Prep Chapter 3: Video walk-through of a few of the mythical creatures, like `unicorn.rb`, `dragon.rb`, and `hobbit.rb`]({{ site.baseurl }}{% link _posts/2019-05-31-turing_prework_03_mythical_creatures.md%})
- [Turing Prep appendix: Troubleshooting Errors]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %})


# Why this series exists

This collection of articles is a guide that will make Turing's mod 1 _much_ easier than it otherwise would be.

We'll do this by working on, (and completing) a few dozen small Ruby exercises. 

You might be thinking: 
> Josh. This already sounds like a lot of work. I just finished my prework, and I know Turing's gonna be brutal. Why should I do all of this _optional_ work, instead of enjoying my last few days of freedom?

Good question. The answer is a digression and tortured analogy on the topics of:
- screwdrivers
- how to learn hard things
- why you should do drills 

By the end of this particular post, I have a few objectives for you:

1. Understand the importance of bringing the right _process_ to hard problems
2. Decide to read _A Mind for Numbers_ and _Deep Work_. 
3. Understand that spending a few dollars and hours _learning how to learn_ is a fantastic start to Turing prep, where you're spending a lot more than a few hours and few dollars to learn a difficult craft. 


# Driving Screws

If I handed you a `Spax` screw, and told you I'd pay you $1000 to screw it into a piece of wood, and then handed you a Phillips screw driver, what would you do?

Spax screws look like this: 

![spax](/images/spax_small.jpg "A spax screw. Notice the shape of the head.")

_A spax screw. Notice the shape of the head._

One would use a Spax bit to drive the screw:

![spax bit](/images/spax_head.jpeg)

A philips screw bit looks like this:

![philips bit](/images/phillips-head-power-bits-196.jpg "Notice the shape of the head. This is shaped like a +, the spax is shaped like a *")

_Notice the shape of the head. This is shaped like a +, the spax is shaped like a *_

Philips bits are for driving philips screws, which look like this:

![philips screw](/images/Flat-Head-Thread-Forming-Screws-Type-F.jpg)

So, can you drive a Spax screw with a Philips bit? 

Not easily. 
<!--more-->

You could try really hard, use great effort, and end up damaging both the screw driver bit _and_ the screw, and probably barely get a single screw in. I bet, though, that you could get a single screw partially embedded in the wood. 

What if I were to pay you $1000 _per screw_ you could drive into the wood? 

Now you can't rely on just herculean effort, sleepless nights, and tenacity. 

_you have to have the Spax bit to drive a Spax screw._

For $1000 per screw, you could afford to buy the correct bit, and it would let you _effortlessly_ drive the screws. 

I'd argue it would be _irresponsible to not get the right tools_. 

The analogy should be clear - you're not being asked to drive screws, you're being asked to learn challenging and technical skills. Most of us didn't learn how to learn hard things in school, we figured out how to game the system and squeak by. 

Or, we didn't learn to game the system and we didn't squeak by. Did anyone else pick up some failing grades in high school and college. No? Just me? OK.

You need to learn software development, and you're probably going to put a lot of time and money into this goal.

*It could be considered irresponsible to not acquire the right kinds of tools for learning technical topics*

Obviously, you need the right physical tools; a laptop, functioning screen, etc. But you need the right knowledge. You need to _know how to learn hard things_.  

# How to learn hard things

To learn hard things, you'll need:
- Specific tactics
- The correct mindset

## Get the right tactics

To obtain the right tactics, and some of the mindset, I strongly recommend buying or renting a copy of [A Mind for Numbers: How to Excel at Math and Science (Even If You Flunked Algebra)](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers). 

While you're waiting for Amazon to deliver the book, or to pick it up from the library, read these two summaries:

- [Faster to Master: Book Summary: “A Mind For Numbers”, Barbara Oakley](https://fastertomaster.com/a-mind-for-numbers-barbara-oakley/)
- [Karl Booklover: A mind for numbers — Summary](https://www.karlbooklover.com/a-mind-for-numbers-summary/)

_A Mind for Numbers_ talks about how to learn hard things. The author talks about mental models, "chunking" information to free up working memory, practice, drills, repetition, staying the right amount out of your comfort zone, doing hard things, avoiding distraction, procrastination, etc. 

Everything in that book is relevant to the rest of your career in software. Please read the book.

Now, I know most of you will not read the book, despite my strong suggestion and humble request that you do so. 

If you're not going to read the book, you don't get to question my methodology for the rest of this guide, so please accept the following truth:

*To learn hard things, you need to build mental models of the hard thing, and you need practice and repetition.*

Most of the world is on board with the value of "drilling" important things. Fire drills, drills for sports teams, drilling to practice something you'll be tested on - all of these are ways to make sure not only that you know how to do the right thing, but _you can't get it wrong_. 

So, working through these drills will move you in the same direction. You'll not just build a single new class from scratch, but you'll eventually do it so many times you can't help but _get it right every time_. 

This will make the rest of your time at Turing go much, much better. It could help save you from repeating a module.

If you _would_ repeat a module, but now you don't, that's six weeks saved, plus a few thousand dollars, and the knowledge will serve you for the rest of your career as a developer. 

But don't take my word for it. Here's what other Turing students have said, after working through this guide:

anonymous_student_1:
>  I definitely feel over prepared in some aspects, but I'm trying to use it to help everyone get to the same levels of understanding

anonymous_student_2:
> It has been amazing and I feel like I learned so much from mythical_creatures...

anonymous_student_3:
> The mythical_creatures felt like it like brought everything together and how it works (on a kindergarten level) but made it all feel...real-ish in a way, and that was huge.

anonymous_student_4:
>  i swear to god, knowing what pry was and having done mythical creatures helped me so much here!


Here's what a student said, who _didn't_ follow this guide:
> I wish I’d done mythical creatures and more before. I really struggled in mod 1

# The Right Mindset

Please read [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/book/show/25744928-deep-work)

_Deep Work_ pairs well with _A Mind for Numbers_ but will help round out some of the "why" of a program like Turing's. It was part of the reason that I went to Turing myself, and I wrote [Quitting the shallow for the deep](https://josh.works/i-quit) about changes I made to my life after reading _Deep Work_ and preparing for Turing.

I wrote that in October 2016. My how the time flies. 

These two books represent a modest investment of time and money. You're going to spend hundreds of hours over the next few months learning programming. $25 of books (or free, if you use a library) plus a few hours of reading may significantly impact the effectiveness of every one of those hours you're already planning on spending focused on programming.

> It could be considered irresponsible to not acquire the right kinds of tools for learning technical topics



## Drills

Both books talk about drills, and focused practice. We're familiar with the idea of drills in other domains (fire drills, sports drills) but it's rare to see the same kind of ideas ported over to "academic" pursuits. 

Well, here we are. If it's good enough for saving lives when the building is burning down, and for every professional athlete that's ever lived, it's good enough for us. 

We're doing drills. _Programming_ drills.

> Why would we do _programming_ drills, Josh? Isn't it just good enough to get some solution once, then move on to another problem?

There's lots of reasons for doing drills. If you want to get into the nitty gritty, know that they line up closely with the principles of [Deliberate Practice](https://jamesclear.com/deliberate-practice-theory) which is "how anyone can learn anything".

But for our purposes, here's why you should do drills:
- Relatively small and focused. You can knock out most of these in just a few minutes.
- Attack the same principle from many directions. You'll do lots of string manipulation, and you'll create classes and object "factories" a bunch of different times. They're similar enough to each other that the knowledge will reinforce itself, but different enough that you have to think hard.
- Force you to reveal and examine your own assumptions about how _your_ code works. You'll be writing a lot of code. You'll have to understand it pretty well by the time you're done.

There's more reasons, but we'll leave it at this.

### Conclusion

You should bring tools suited to the task at hand. If you need to drive Spax screws, bring a Spax screw bit. 

Read 
- [Mind for Numbers: How to Excel at Math and Science (Even If You Flunked Algebra)](https://www.goodreads.com/book/show/18693655-a-mind-for-numbers)
- [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/book/show/25744928-deep-work)

If you're not going to read the books, at least read these summaries:
- [Faster to Master: Book Summary: “A Mind For Numbers”, Barbara Oakley](https://fastertomaster.com/a-mind-for-numbers-barbara-oakley/)
- [Karl Booklover: A mind for numbers — Summary](https://www.karlbooklover.com/a-mind-for-numbers-summary/)
- [“Deep Work: Rules for Focused Success in a Distracted World” by Cal Newport (Book Summary)](https://www.njlifehacks.com/deep-work-cal-newport-summary/)
- [Deep Work by Cal Newport (book summary)](https://www.samuelthomasdavies.com/book-summaries/business/deep-work/)

Be swayed by other students who have worked through this guide and have felt very well prepared by it. They've saved themselves time, stress, sleepless nights, perhaps money, and much more. 

### What's next?

Well, just click on over to part two:

[Turing Prep Chapter 2: Your first passing tests!]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %}) )


