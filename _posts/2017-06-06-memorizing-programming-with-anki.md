---
layout: post
title:  "Anki and Memorization with Spaced Repetition Software"
date:   17-06-06 06:18:52 -0600
categories: programming learning
tags: [programming, learning, turing, anki, phone_usage]
permalink: anki-spaced-repetition-system
---

_This is not meant to be read in isolation. Memorization is almost useless without doing work ahead of time to grasp the material. For the full context, start with [Learning how to Learn](/learning-how-to-learn)_

I've not been able to find any comprehensive guides to using Anki to learn _programming_, so this article is a deep-dive on just that topic, from installation and configuration to building good programming-related flashcards. 

We'll cover a few pieces:

1. [What is Anki, and Spaced Repetition Software?](#anki-srs)
1. [Why would you use it?](#two-primary-benefits)
1. [Getting started: Your first card](#getting-started-your-first-card)
1. [Configure Anki on your phone](#configure-anki-on-your-phone)
1. [Markdown and Anki](#markdown-and-anki)
1. [Install Markdown Package](#install-markdown-package)
1. [Using the Markdown package](#using-the-markdown-package)
1. [Building a good first programming-related flashcard](#building-programming-related-flashcards)


# Anki Spaced Repetition Software

Anki has been one of my favorite tools I've encountered in the last few years. I started using it initially for learning Spanish vocabulary, but as I started learning programming, it really started to shine.

Anki is a flashcard application that attacks the issue of "memory decay" to retain and strengthen recall of anything you want.

### Spaced Repetition Software

If you learn something today, you might remember it tomorrow, but will probably forget it in three or four days. However, if you review it before you forget it, it'll "stick" in your head for a bit longer than it did the first time you learned it. This "forgetting curve" can be bent exponentially in your favor. 

Here's how remembering (and forgetting) over time tends to play out:

![the famous forgetting curve, from Wired Magazine](/images/ff_wozniak_graph_f.jpg)

The goal here is to create relevant, well-formatted bits of knowledge, and then get them in Anki and review it the minimum amount of times to ensure that we'll remember it for a very, very long time. (I.E. so long I can never forget it, so several years, at least)

<!--more-->


![Anki's unassuming UI](/images/17-05-16-anki.jpg "Anki's unassuming user interface")

On first blush, Anki has an unassuming user interface. 

Continuing the example from [learning how to learn](/learning-how-to-learn), here's the 'front' of one of my flashcards:


![Anki card for using OmniAuth to manage user session](/images/17-05-16-anki_1.jpg)

_This card looks complicated, but it's actually easy_. You'll notice that I basically gave myself the answer in the question setup. I'm simply training myself to recognize how I set up the `User` class, and that it has a class method `from_omniauth`, and building a mental model of how I use `request.env["omniauth.auth"]`.

the answer is:

`if user = User.from_omniauth(request.env["omniauth.auth"])`

And I prefer easy flashcards (more work to make, less difficult to recall) than difficult flashcards.

For Anki's basics, go check out this excellent guide: [Spaced Repetition](https://www.fluentin3months.com/spaced-repetition/).

I put all sorts of information in Anki. At the moment I have about <strike>850</strike> 1200+ programming-related cards, which covers _many_ topics related to software development. 

I've got cards related to:

- Ruby and Rails 
- Linux terminal commands and their options, like `grep` and `xargs`
- Git/Github
- JavaScript
- HTML/CSS
- SQL
- Regular Expressions 
- iTerm & Atom keyboard shortcuts

I am confident that I have _not_ found the ideal workflow around creating and memorizing Anki cards. I'm still trying to improve this process, but the benefit of using Anki far outweighs for me any cost of having less-than-perfect cards.

My Anki workflow has two steps:

1. Make the Anki cards (on my laptop)
2. Review the Anki cards (on my phone)

I can review my Anki cards anywhere. In line at the grocery store, in the bathroom (yes), on a train, while I'm waiting for my food to microwave, etc.

I normally hate to be the person staring at his phone all day, but since I'm usually on Anki, I now embrace it.

According to [PhoneUsage](https://play.google.com/store/apps/details?id=pt.aguiar.phoneusage) I spend between 30 and 45 minutes on Anki review per day, and it's all in little snippets of time grabbed here and there. ([a bit about how I manage my phone usage every day here]({{ site.baseurl }}{% link _posts/2016-07-04-three-android-apps-i-use-every-day-and-maybe-youll-use-them-too.md %}))

## Two primary benefits

> Cool, Josh, all this sounds nice, but it is a lot of work, especially to spend 30 minutes or an hour every day building and reviewing note cards. I'm busy, and if I'm learning programming, I'll be even more busy than I am now. 
>
> Why is Anki better than just studying a topic more?

### 1. The process of recalling answers from memory solidifies subtle-but-important details

There are lots of small-but-meaningful details we encounter when trying to make computers do our bidding. 

The presence of a comma in a list of arguments, or if a method is a class or instance method, or if that `git reset` command uses `--HARD` as an argument - these all can introduce tiny bits of friction in our goals. I see a lot of what I am memorizing as not necessarily just learning _new_ things, but making sure that the things I _have_ learned, I know very well. 

For example, if you're not sure how the params of a `post` request are formatted, once you've built and memorized a few cards related to this formatting, you can better access elements in that hash because you already know the basic structure to expect.

Alternatively, are you 100% sure of the format for building a `.reduce` iterator? What's the difference between `[].reduce() do |result, item|` and `[].reduce({}) do |result, item|`? With a few note cards on building/using the `reduce` method, you'll spot the difference immediately, and know how to reason about it. 

These are _subtle but important details_. Remember - computers are not that smart, they're just extremely literal. Details make or break everything you build. 

### 2. This memorization functions as a progress-capture device for new things you learn

How often do you use a new method, or try to implement a basic feature, and you are _positive_ you've encountered the topic before, but cannot remember what you actually did?

You're off to the docs, or looking at previous projects, until you refresh your memory.

This is fine, and even with Anki you'll be regularly referencing documentation and prior code, but you'll do it much less, because so much of what you've seen before you've memorized. It's just sitting in your brain, ready to be used again.

Sometimes, even though I've memorized cards, I cannot quite reproduce the whole chunk of knowledge from scratch, so I just open up the deck and find the card that relates to the thing I'm trying to do. It's a bit like keeping detailed notes and always knowing exactly where to find the relevant information for what you're looking for. 

Or, that one time I had to rename a branch in Git - what was the exact syntax for pushing the deleted branch? Did I actually _rename_ the branch, or did I use the `git branch -m` command to create a _new_ branch? (hint - the next step is `git push origin :old_branch_name`, then push the new one with `git push origin --set-upstream origin new_branch`. I just opened up Anki to check the steps. Super simple.)

# Installing Anki 

[Download the desktop app here](https://apps.ankiweb.net/).

Here's the thing - Don't download the current version of the app. The rest of these instructions will work only on the `Anki for Mac OS X 10.8+ (2.0.52-standard)` version. 

You can find the proper version on the home page, here:

![download older Anki](/images/2019-05-10-old_anki_download.jpg).

If you download the newest version of Anki, the best `markdown` packages won't work for you. ☹️

Download it, install it, and open the program. 

# Getting started: Your first card

Make a new deck. Call it "programming" or "test deck" or whatever. Now click the "new card" button. 

In the box labeled "front", put "what is my name". On the "back" put your actual name. Or perhaps a more relevant question, like: 


Front: 
> Who writes the most long-winded and rambling blog posts in the world, and embarrassingly refers to himself in the third person every now and again?

Back: 

> Josh Thompson


Make two or three cards. It will be easiest to see how Anki works with more than one card in the deck.

Now, lets review your cards. Hit the "Study now" button, and think hard about the answer to the first card.

For purposes of explanation, lets say you cannot remember either your name or my name. Admit defeat, and click the "show answer" button.

Since you couldn't remember, click the left-most button on the bottom, that says `<10m, Again`.

This button is how you signal to Anki that you didn't know the answer, and the card will immediately be re-queued for you to study within the next ten minutes.

Once you click the button, the next card will show up. Lets say you _do_ know the answer to this question. Click "show answer", and then click the button labeled "good". 

You've got three options when you've recalled the right answer. They are labeled "hard", "good", and "easy". Depending on which one you click, the time that will elapse between now and when you see the card again will change.

If the answer was hard for you, you want to see the card again soon. If it was easy, you'd like it to be a longer period of time before seeing it again. 

Depending on how many times you've reviewed the card, the time intervals associated with the card will change.

Here's the intervals I am seeing on some of the cards I've reviewed today:

![forty day range](/images/2018-06-28_memorizing_programming_01.jpg "a range of a month")

If I click the "Hard" button, I'll see it again in 12 days. If I click easy, I'll see it in almost 29 days. 

I tend to click the default "good" button, and thats what I did with this one.

Here's another, older card, where I can decide if I want to see it again in six months, 11 months, or 14 months:

![seven month range](/images/2018-06-27_memorizing_programming_03.jpg)

You'll get a feel for how this works, and what are the best answers for you, as you go. 

The next step is to hook up Anki and your phone

## Configure Anki on your phone

Since you'll be _building_ cards on your computer, but most likely _reviewing_ them on your phone, we'll go ahead and get Anki working on your phone. 

Download the phone app: 
- [Anki for Android](https://play.google.com/store/apps/details?id=com.ichi2.anki&hl=en)
- [Anki for iPhone](https://itunes.apple.com/us/app/ankimobile-flashcards/id373493387?mt=8&ign-mpt=uo%3D4)

_The iPhone app costs $25. The Android app is free, the iPhone app is not. $25 seems like a lot. The author explains this price [here](https://anki.tenderapp.com/kb/anki-ecosystem/why-does-ankimobile-cost-more-than-a-typical-mobile-app). According to my phone's stats, I've spent 96 hours of active flashcard review time with Anki at the time of this writing, which boils down to $0.25/hr. I consider this to be an extremely good use of my time and money. Look for the value, not the cost._

### Create/sign in to your AnkiWeb account

#### 1. [Sign up for a new AnkiWeb account](https://ankiweb.net/account/register)

#### 2. Sign into your AnkiWeb account on the desktop Anki application

_get screenshot of what it looks like not signed in to an account_

In the desktop application, hit the "sync" button:

![Sync Desktop app with AnkiWeb](/images/2018-06-27_memorizing_programming_04.jpg "sync desktop with Anki Web")

#### 3. Sign in on the phone application. 

For Android, you'll the following, in this order:


- Tap the hamburger menu
- Tap "Settings"
- Tap "AnkiDroid general settings"
- Tap "Sign In to account"

<sign in, need pictures from different account>

Now hit the "Sync" button on your phone:
 
 _phone screenshot here_
 
 And you should see the info from your desktop showing up on your phone! 

_Take a deep breath. This is a big accomplishment, and you're most of the way done with getting configured on Anki!_


## Markdown and Anki

Since we're doing _programming_ related flash cards, and one of the first rules of formulating knowledge is "specificity", we want code snippets in Anki to look like code snippets on our computer. 

Lets say you want to make an Anki flashcard related to the placement of this `begin` and `rescue` in this chunk of code:

![code snippet](/images/2018-06-03_memorizing_programming_01.jpg "a picture of some code")

Which of these cards do you think would be more effective for learning?

Option one: 

![ineffective card](/images/2018-06-03_memorizing_programming_02.jpg "a less-effective format")

Option two:

![more effective code](/images/2018-06-03_memorizing_programming_03.jpg "a more-effective format")

The second option is much, much more readable and understandable. 

To format your code like this, you'll need to install (and use) a Markdown package. 

## Install Markdown Package

We will be using the [Power Format Pack](https://ankiweb.net/shared/info/162313389) package. 

#### 1. Add the Markdown package to Anki

Navigate through the following menu, and entering the number `162313389` when it's requested. (The number is the end of the URL of the package we want.)

`Desktop > Tools > Add-ons > browse and install`

![How to add packages](/images/2018-06-28_memorizing_programming_02.jpg "How to add packages")

When you click the `Browse & Install` button, just enter `162313389`

![adding the markdown add-on](/images/2018-06-28_memorizing_programming_03.jpg "adding the markdown add-on")

#### 2. Restart Anki, per the instructions

#### 3. Enable the new Markdown package

Check the "Enable Markdown" button. (It's very buried):

`Tools > Power Format Pack add-on (options) > Options > Markdown > Enable Markdown`

#### 4. Restart Anki again

Now, open up the "make a new card" user interface, and on the far right side, you should have an `M` visible to you:

![Markdown Package, ready to go!](/images/2018-06-03_memorizing_programming_04.jpg "the Markdown package is ready to go!")

If you can see that `M`, you're ready to go. This means you can write in markdown, hit the `M`, and it'll get that beautiful Markdown formatting. 

## Using the Markdown package

Markdown is great. I use it constantly. In fact, this entire post is composed in Markdown - all of my text formatting, code blocks, links, and images are written in Markdown.

If you don't know Markdown, _you can ease into using Anki by learning to use Markdown_. 

Let's start with something basic - using fixed-width color offset to draw attention to technical language. 

### Backticks to make text `formatted and fixed-width`

"Visual hierarchy" is a huge way to help the human eye differentiate the important from the unimportant, or between things of different types. 

Here's two was to write the same question. This is a question I asked someone on my team recently:


> what value do you use for SIDEKIQ_PORT in config/application.yml?

Compare that with:

> what value do you use for `SIDEKIQ_PORT` in `config/application.yml`?

The one with the text formatting is easier to understand. Lets extend this principle to building programming-related flashcards.

Imagine an Anki card that says:

> what does array.sort do?

You can draw a little more attention to the specifics of the question (it's about an Array, and it's an instance method!) by using:

> What does Array::sort do?

But that doesn't catch the eye nearly as well as:

> What does `Array::sort` do?

So, to off-set text like that, you just "wrap" it in backticks, the key to the left of the `1` on your keyboard.

> This is what text that's been `wrapped in backticks` looks like

So, make a card like this in Anki:


![Anki card to learn some markdown](/images/2018-06-03_memorizing_programming_anki_05.jpg)

What makes text `formatted and fixed-width`

And you can toggle markdown/not-markdown with the `m` in the corner:

![toggle markdown](/images/2019-08-15-anki-make-markdown.gif)

Make a few more cards. For example, figure out how to make a large block of pre-formatted text, or give a block of code language-specific syntax highlighting. 

![language-specific syntax highlighting](/images/2019-08-15-anki-toggle-ruby-formatting.gif)

# Building programming-related flashcards!

Wahoo! You've almost made it! The end goal is in sight!


I'd recommend keeping two points in mind before proceeding:

#### 1. Go slow

I have a cap for ten new cards a day, even if I make twenty flashcards. Experiment with what works for you, but swamping yourself with cards makes it less likely that you'll stick with the tool.

Here's how to set the maximum number of new cards a day. I would set it to about seven:

![seven new cards/day](/images/anki_set_new_card_limit.gif)

#### 2. Build multiple cards around each discrete piece of knowledge you want to acquire. 

If you want to remind yourself of how to use `.map` in Anki, make three or five different flashcards, testing it from different directions.

For example, card 1 might be:

Front:
```
What method can I call on an array to iterate through each item, 
and it returns the mutated array?
```
Back:
```
Array.map
```

Card 2:

front: 
```
what do I call to add 1 to each number?
```
```ruby
[1, 2, 3].? do |num|
  num + 1
end
```
back:
```ruby
[1, 2, 3].map do |num|
  num + 1
end

=> [2, 3, 4]
```

Card 3:

Front:

```
letters = ['lkj', 'kwidk', 'wwid888']

What's a one-liner to make all above letters capitalized, so that:

big_letters = ["LKJ", "KWIDK", "WWID888"]
```
Back:

```ruby
big_letters = letters.map { |w| w.upcase }
=> ["LKJ", "KWIDK", "WWID888"]
```

Next, read a bunch of these articles below, and go forth and prosper!

Oh, and if you're like me and love using _screenshots_ in Anki, go for it! I use [Annotate.app](https://itunes.apple.com/us/app/annotate-capture-and-share/id918207447?mt=12), but any tool will work. Make your screenshot, and drag it into Anki, and it'll be ready to use. 


### Resources on Memorization

- [Effective learning: Twenty rules of formulating knowledge](https://www.supermemo.com/en/articles/20rules)
- [Spaced repetition: Never forget vocabulary ever again (in the context of language learning, but perfectly applicable to programming)](https://www.fluentin3months.com/spaced-repetition/)
- [Memorizing a programming language using spaced repetition software](https://sivers.org/srs)
- [JANKI METHOD: Using spaced repetition systems to learn and retain technical knowledge.](http://www.jackkinsella.ie/articles/janki-method)
- [Markdown code formatting in Anki](https://ankiweb.net/shared/info/162313389)
- [Spaced Repetition](https://www.gwern.net/Spaced%20repetition)
- [Anki tips](http://rs.io/anki-tips/)
- [Wired Magazine: Want to Remember Everything You’ll Ever Learn? Surrender to This Algorithm](https://www.wired.com/2008/04/ff-wozniak/)
