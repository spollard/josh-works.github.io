---
layout: post
title:  "On Memorization with Spaced Repetition"
date:   17-06-06 06:18:52 -0600
categories: programming learning
tags: [programming, learning, turing, anki, phone_usage]
permalink: anki-spaced-repetition-system
---

_This is not meant to be read in isolation. Memorization is almost useless without doing work ahead of time to grasp the material. For the full context, start with [Learning how to Learn](/learning-how-to-learn)_

I've not been able to find any comprehensive guides to using Anki to learn _programming_, so this article is a deep-dive on just that topic, from installation and configuration to building good programming-related flashcards. 

We'll cover a few pieces:

TODO: modify index to include ['installation', 'configuration', 'building good flashcards']

1. [What is Anki, and Spaced Repetition Software?](#anki-srs)
1. [Why would you use it?](#two-primary-benefits)
1. [How do you get started with it?](#getting-started-your-first-card)


# Anki SRS

Anki has been one of my favorite tools I've encountered in the last few years. I started using it initially for learning Spanish vocabulary, but as I started learning programming, it really started to shine.

Anki is a flashcard application that makes use of the concept of "memory decay" to retain and strengthen recall of anything you want.

### Spaced Repetition Software

If you learn something today, you might remember it tomorrow, but will probably forget it in three or four days. However, if you review it before you forget it, it'll "stick" in your head for another five or six days.

Here's how remembering (and forgetting) over time tends to play out:

![the famous forgetting curve, from Wired Magazine](/images/ff_wozniak_graph_f.jpg)

The goal here is to create relevant, well-formatted bits of knowledge, and then get them in Anki and review it the minimum amount of times to ensure that we'll remember it for a very, very long time. (I.E. so long I can never forget it, so several years, at least)

<!--more-->


TODO: update this picture to show whole desktop>

![Anki's unassuming UI](/images/17-05-16-anki.jpg "Anki's unassuming user interface")

On first blush, Anki has an unassuming user interface. 

Continuing the example from [learning how to learn](/learning-how-to-learn), here's the 'front' of one of my flashcards:

TODO: expand screenshot to show entire desktop.

![Anki card for using OmniAuth to manage user session](/images/17-05-16-anki_1.jpg)

_This card looks complicated, but it's actually easy_. You'll notice that I basically gave myself the answer in the question setup. I'm simply training myself to recognize how I set up the `User` class, and that it has a class method `from_omniauth`, and building a mental model of how I use `request.env["omniauth.auth"]`.

the answer is:

`if user = User.from_omniauth(request.env["omniauth.auth"])`

And I prefer easy flashcards (more work to make, less to memorize) than difficult flashcards.

For Anki's basics, go check out this excellent guide: [Spaced Repetition](https://www.fluentin3months.com/spaced-repetition/).

I put all sorts of information in Anki. At the moment I have about <strike>850</strike> 950 programming-related cards, which covers _many_ topics related to software development. 

I've got cards related to:

- Ruby and Rails, of course, 
- Github
- iTerm & Atom usage/shortcuts
- Regular Expressions 
- SQL 
- RSpec/minitest, 
- Linux terminal commands and their options, like `grep` and `xargs`

I am confident that I have _not_ found the ideal workflow around creating and memorizing Anki cards. I'm still trying to improve this process, but the benefit of using Anki far outweighs for me any cost of having less-than-perfect cards.

My Anki workflow has two steps:

1. Make the Anki cards (on my laptop)
2. Review the Anki cards (on my phone)

I can review my Anki cards anywhere. In line at the grocery store, in the bathroom (yes), on a train, while I'm waiting for my food to microwave, etc.

I normally hate to be the person staring at his phone all day, but since I'm usually on Anki, I now embrace it.

TODO check following URL: 

According to [PhoneUsage]({{ site.baseurl }}{% link _posts/2016-07-04-three-android-apps-i-use-every-day-and-maybe-youll-use-them-too.md#phone-usage-dont-waste-your-life %} ) I spend between 30 and 45 minutes on Anki review per day, and it's all in little snippets of time grabbed here and there.

## Two primary benefits

Why pour all this time into making and memorizing notecards? More importantly, if you're on the fence about taking the plunge with Anki, why should you carve our your valuable and scarce time and resources to do flashcards?

### 1. The process of recalling answers from memory solidifies subtle-but-important details

There are lots of small-but-meaningful details we encounter when trying to make computers do our bidding. 

The presence of a comma in a list of arguments, or if a method is a class or instance method, or if that `git reset` command uses `-hard` or `--hard` as an argument - these all can introduce tiny bits of friction in our goals. I see a lot of what I am memorizing as not necessarily just learning _new_ things, but making sure that the things I _have_ learned, I know very well. 

For example, if you're not sure how the params of a `post` request are formatted, once you've built and memorized a few cards related to this formatting, you can better access elements in that hash because you already know the basic structure to expect.

### 2. This memorization functions as a progress-capture device for new things you learn

How often do you use a method, or try to implement a basic feature, and you are _positive_ you've encountered the topic before, but cannot remember what you actually did?

You're off to the docs, or looking at previous projects, until you refresh your memory.

This is fine, and even with Anki you'll be regularly referencing documentation and prior code, but you'll do it much less, because so much of what you've seen before you've memorized. It's just sitting in your brain, ready to be used again.

# Installing Anki 

TODO: Have Kristi test-drive a draft of this article, make sure she gets a sample card set up, AND makes a mark-down formatted card. 

[Download the desktop app here](https://apps.ankiweb.net/).

[Sign up for a new AnkiWeb account here](https://ankiweb.net/account/register)

# Configuring Anki on your computer

Since we're doing _programming_ related flash cards, and one of the first rules of formulating knowledge is "specificity", we want code snippets in Anki to look like code snippets on our computer. 

Lets say you want to make an Anki flashcard related to this chunk of code:

![code snippet](/images/2018-06-03_memorizing_programming_01.jpg "a picture of some code")

Which of these cards do you think would be more effective for learning?

Option one: 

![ineffective card](/images/2018-06-03_memorizing_programming_02.jpg "a less-effective format")

Option two:

![more effective code](/images/2018-06-03_memorizing_programming_03.jpg "a more-effective format")

The second option is much, much more readable and understandable. To format your code like this, you'll need to install (and use) a Markdown package. 

## Install Markdown Package

[Install the Markdown package](https://ankiweb.net/shared/info/162313389). Syntax highlighting is gold.

`Desktop > Tools > Add-ons > browse and install`

https://ankiweb.net/shared/info/162313389

Restart Anki, per the instructions

`tools > supplementary add-ons > options > enable markdown`

Restart Anki again?

Now, open up the "make a new card" user interface, and on the far right side, you should have an `M` visible to you:

![Markdown Package, ready to go!](/images/2018-06-03_memorizing_programming_04.jpg "the Markdown package is ready to go!")

If you can see that `M`, you're ready to go. 

## Using the Markdown package

Markdown is great. I use it constantly. In fact, this entire post is written in Markdown. 

If you don't know Markdown, _you can ease into using Anki by learning to use Markdown_. 

Let's start with something basic - using fixed-width color offset to draw attention to technical language. 

### Backticks to make text `formatted and fixed-width`

TODO: Screenshot slack conversation about `env` files:

> Question - what value do you use for `SIDEKIQ_PORT` in your `config/env`?

Imagine a card like "what does Array.sort do?"

You can draw a little more attention to the specifics of the question (it's about an Array, and it's a class method!) by using:

> What does Array::sort do?

But that doesn't catch the eye nearly as well as:

> What does `Array::sort` do?

So, to off-set text like that, you just "wrap" it in backticks, the key to the left of the `1` on your keyboard.

`wrapped in backticks`

So, make a card like this in Anki:

TODO: Explain using Annotate.app

![Anki card to learn some markdown](/images/2018-06-03_memorizing_programming_05.jpg)

What makes text `formatted and fixed-width`




# Configure Anki on your phone

Download the phone app. [Android](https://play.google.com/store/apps/details?id=com.ichi2.anki&hl=en) [iPhone](https://itunes.apple.com/us/app/ankimobile-flashcards/id373493387?mt=8&ign-mpt=uo%3D4)

_The iPhone app costs $25. The Android app is free, the iPhone app is not. $25 seems like a lot. The author explains this price [here](https://anki.tenderapp.com/kb/anki-ecosystem/why-does-ankimobile-cost-more-than-a-typical-mobile-app). According to my phone's stats, I've spent 96 hours of active flashcard review time with Anki, which boils down to $0.25/hr. I consider this to be an extremely good use of my time and money. Look for the value, not the cost._

Sign in on your desktop:

<sign in>

Sign in on your phone:

Android:
- Hamberger menu
- settings
- AnkiDroid general settings
- sign in to account


# Getting started: Your first card

Make a card. On the front put "what is my name". On the "back" put your actual name.

Hit the sync button, and then sync the app on your phone, and make sure the card shows up.

Once you've got that, you can review the card. Assuming you get it right, you'll see it only twice on the first day.

Make another card, experiment with giving the "wrong" answer.

Assuming all is running well, you're now able to start adding real life cards to your Anki deck.


# Building programming-related flashcards!

Wahoo! You've made it! The end goal is in sight!


I'd recommend two starting points before proceeding, and a few guiding principles:

2. Go slow. I have a cap for ten new cards a day, even if I make twenty flashcards. Experiment with what works for you, but swamping yourself with cards makes it less likely that you'll stick with the tool.

https://cl.ly/472s3u1G2y2D/Screen%20Recording%202018-04-30%20at%2008.51%20PM.gif

Next, read a bunch of these articles below, and go forth and prosper!


### Resources on Memorization

- [Effective learning: Twenty rules of formulating knowledge](https://www.supermemo.com/en/articles/20rules)
- [Spaced repetition: Never forget vocabulary ever again (in the context of language learning, but perfectly applicable to programming)](https://www.fluentin3months.com/spaced-repetition/)
- [Memorizing a programming language using spaced repetition software](https://sivers.org/srs)
- [JANKI METHOD: Using spaced repetition systems to learn and retain technical knowledge.](http://www.jackkinsella.ie/articles/janki-method)
- [Markdown code formatting in Anki](https://ankiweb.net/shared/info/162313389)
- [Spaced Repetition](https://www.gwern.net/Spaced%20repetition)
- [Anki tips](http://rs.io/anki-tips/)
- [Wired Magazine: Want to Remember Everything You’ll Ever Learn? Surrender to This Algorithm](https://www.wired.com/2008/04/ff-wozniak/)
