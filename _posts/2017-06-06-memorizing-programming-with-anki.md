---
layout: post
title:  "On Memorization with Spaced Repetition"
date:   17-06-06 06:18:52 -0600
categories: programming learning
tags: [programming, learning, turing, anki]
permalink: anki-spaced-repetition-system
---

_This is not meant to be read in isolation. Memorization is almost useless without doing work ahead of time to grasp the material. For the full context, start with [Learning how to Learn](/learning-how-to-learn)_

We'll cover a few pieces:

1. [What is Anki, and Spaced Repetition Software?](#anki-srs)
1. [Why would you use it?](#two-primary-benefits)
1. [How do you get started with it?](#getting-started-your-first-card)

<!--more-->

# Anki SRS

Anki has been one of my favorite tools I've encountered in the last few years. I started using it initially for learning Spanish vocabulary, but as I started learning to program, it became as much a part of that workflow as my language learning.

Anki is a flashcard application that makes use of the concept of "memory decay" to retain and strengthen recall of anything you want.

### Spaced Repetition Software

If you learn something today, you might remember it tomorrow. If you don't have to recall the fact again, you might forget it in two or three days. If you review it before you forget it, it'll "stick around" in your head a bit longer than the first time interval.

![the famous forgetting curve, from Wired Magazine](images/ff_wozniak_graph_f.jpg)

The goal here is to create well-formatted bits of knowledge, and then get them in Anki and review it the minimum amount of times to ensure that we'll remember it for a very, very long time. (> 1 year).



![Anki's unassuming UI](/images/17-05-16-anki.jpg)

Anki's has a most unassuming UI

Continuing the example from [learning how to learn](/learning-how-to-learn), here's one of my flashcards:

![Anki card for using OmniAuth to manage user session](/images/17-05-16-anki_1.jpg)

_This card is easy_. You'll notice that I basically gave myself the answer in the question setup.

the answer is:

`if user = User.from_omniauth(request.env["omniauth.auth"])`

This is still testing me, and helping me build a mental model of what is going on.

And I prefer easy flashcards (more work to make, less to memorize) than difficult flashcards.

For Anki's basic usage, go check out this excellent guide: [Spaced Repetition](https://www.fluentin3months.com/spaced-repetition/).



I put all sorts of information in Anki. At the moment I have about 850 programming-related cards, which covers everything related to software development. I've got cards related to Ruby and Rails, of course, but also general tools and worklow, like Github, iTerm and Atom usage/shortcuts, Regex, SQL, RSpec, Terminal commands (Like `grep` and `xargs`).

I am confident that I have _not_ found the ideal workflow around creating and memorizing Anki cards. I'm still trying to improve this process, but the benefit of using Anki far outweighs for me any cost of having less-than-perfect cards.

My Anki workflow has two steps:

1. Make the Anki cards (on my laptop)
2. Review the Anki cards (on my phone)

I can review my Anki cards anywhere. In line for something, in the bathroom (yes), on the train, while I'm waiting for my food to microwave, etc.

I normally hate to be the person staring at his phone all day, but since I'm usually on Anki, I now embrace it.

I spend about 30 minutes (sometimes 45) studying Anki per day, according to my phone, and it's all in little snippets of time grabbed here and there.

## Two primary benefits

Why pour all this time into making and memorizing notecards? More importantly, if you're on the fence about taking the plunge with Anki, why should you carve our your valuable and scarce time and resources to do flashcards?

### 1. The process of recalling answers from memory solidifies subtle-but-important details

The presence of a comma in a list of arguments, or if a method is a class or instance method, or if that `git reset` command uses `-hard` or `--hard` as an argument.

If you're checking how the params of a `post` request are formatted, once you've memorized that card, you can access elements in that hash much more easily, because you already know the basic structure to expect.

### 2. This memorization functions as a progress-capture device for new things you learn

How often do you use a method, or try to implement a basic feature, and you are _positive_ you've encountered the topic before, but cannot remember what you actually did?

You're off to the docs, or looking at previous projects, until you refresh your memory.

This is fine, and even with Anki you'll be regularly referencing documentation and prior code, but you'll do it much less, because so much of what you've seen before you've memorized. It's just sitting in your brain, ready to be used again.

## Getting started: Your first card

I've been using Anki regularly for over seven months at this point. I've used it off and on before starting Turing, so I've got a fair amount of exposure to it, and have been able to forget how frustrating it is to wrestle with the software.

Anki's UI is clunky, and it is difficult to get cards formatted just right.

On top of that, I'm no expert at building good flash cards, so I'm often fighting with myself, on top of wrestling with the tool.

If everything is going perfectly, I still wake up every day with a bunch of note cards I have to study, and if I skip a day of studying, they pile up and I have an even larger stack the next day.

Sometimes I have twenty five cards to review, and it takes ten minutes. I've I've been busily creating new flashcards for a few days in a row, I might end up with 60 cards to review.

If I skip a day or two, that number climbs to 100-120.

Still interested? OK.

1. [Download the desktop app here](https://apps.ankiweb.net/).
2. [Sign up for a new AnkiWeb account here](https://ankiweb.net/account/register)
3. Download the app. [Android](https://play.google.com/store/apps/details?id=com.ichi2.anki&hl=en) [iPhone](https://itunes.apple.com/us/app/ankimobile-flashcards/id373493387?mt=8&ign-mpt=uo%3D4)

_The iPhone app costs $25. The Android app is free, the iPhone app is not. $25 seems like a lot. The author explains this price [here](https://anki.tenderapp.com/kb/anki-ecosystem/why-does-ankimobile-cost-more-than-a-typical-mobile-app). According to my phone's stats, I've spent 96 hours of active flashcard review time with Anki, which boils down to $0.25/hr. I consider this to be an extremely good use of my time and money. Look for the value, not the cost._


Once you have the app on your computer, and the app on your phone, and youv'e created an AnkiWeb account, you're well on your way. Sign into your account on the desktop app and your phone app, and then open up Anki on your computer.

Make a card. On the front put "what is my name". On the "back" put your actual name.

Hit the sync button, and then sync the app on your phone, and make sure the card shows up.

Once you've got that, you can review the card. Assuming you get it right, you'll see it only twice on the first day.

Make another card, experiment with giving the "wrong" answer.

Assuming all is running well, you're now able to start adding real life cards to your Anki deck.

I'd recommend two starting points before proceeding, and a few guiding principles:

1. [Install the Markdown package](https://ankiweb.net/shared/info/162313389). Syntax highlighting is gold.
2. Go slow. I have a cap for ten new cards a day, even if I make twenty flashcards. Experiment with what works for you, but swamping yourself with cards makes it less likely that you'll stick with the tool.

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
