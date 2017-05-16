---
layout: post
title:  "On Learning"
date:   2017-05-14 06:18:52 -0600
categories: programming learning
permalink: learning-learning
---


I've recently been thinking about learning how to learn, specifically in the context of software development.

I am a bit hyperactive when it comes to trying to learn new things, so over the last few years, I've done a lot of _inneffective_ learning, and at least a little bit of _effective_ learning.

I'm defining "learning" or "learning a topic" as _able to rearrange or reorganize or reuse the idea in new ways to resolve unstructured problems you face_.

This "rearranging/reorganizing" and "unstructured problems" explicitly excludes the kind of learning most of us have done when we were young, where we just tried to have the right answer for fill-in-the-blank questions like "In _____(year) Christopher Columbus sailed the ocean blue"

If you have to learn things that you don't know now, read on.

## Overview of Process

All things worth doing should fit into some sort of process. If there's no process, I'm just shooting in the dark, hoping to hit something. That said, the right process is almost always not the first thing you try, and I'm careful with "expert advice", for many reasons. So, I like to try to pick a reasonable starting point, and experiment with process from there.

Here's my _current_ iteration of "how to learn difficult things"

- Find the boundaries of the topic. "Software development" has no boundaries. "Session management in conjunction with OmniAuth/Github" is well-bounded.
- Find a way to play with the component pieces. If it's code, I'll spend time in a REPL session, experimenting with different pieces.

(With the Omniauth example above, the "object" that comes back from a successfully logged in user can be accessed in the `request`. So, I'd look at the `request` object, the `request.env` object, the `request.env["omniauth.auth"]`, object, `request.env["omniauth.auth"].keys`, and examine each of the sub-pieces.)

- Write down, on real dead trees, the component pieces of the process. At a low level, this is actual code blocks, and once I get the individual pieces (for example, using a `from_omniauth(auth_params)` method with `first_or_create_by` to query my `users` database) I'll then write out the associated piece of code next to it. So, if i'm moving between a `user` model and `sessions` controller, I'll write both code blocks side by side. I can easily add in the related routes and views, and anything else that fits into the process along side.

The process of writing code out, by hand, helps me identify the many wrong assumptions I make about the code as I am reading it.

- Write down again, at a higher level, the involved pieces. At this point, I might just be writing down the involved object types, and their associated methods. I.E.

```ruby
# sessions#create
def from_omniauth(auth_params)

#user.rb
def self.from_omniauth
```

This way I've got a detailed and higher-level mental model of what is happening.

- Get a few "reps" of implementation. If I was following a tutorial, I'll delete the work I just did and implement again, without referring to anything but my paper notes. (This is a santity check to make sure I captured the right information on paper. Often I've not caught enough, so I modify my notes.)

- Capture some of the high and low level details in Anki. (more on that below)
- Memorize the Anki cards
- Done for now, and until I re-encounter the topic again.


# Anki SRS

Anki feels a bit like a really powerful weapon that is really hard to wield, and can do a lot of damage to the person wielding.

Maybe like a 10lb hand-grenade. It's *awesome* if you can put it where you want it, and it blows away all the gremlins/zombies whatever, but unfortunately, throwing a 10lb _anything_ is not easy.

![Anki's unassuming UI](/images/17-05-16-anki.jpg)

Anki's unassuming UI

Continuing the above example, here's one of my flashcards:

![Anki card for using omniauth to manage user session](/images/17-05-16-anki_1.jpg)



_This card is easy_. You'll notice that I basically gave myself the answer in the question setup.

the answer is:

`if user = User.from_omniauth(request.env["omniauth.auth"])`

This is still testing me, and helping me build a mental model of what is going on.

And I prefer many easy flashcards (more work to make, less to memorize) than a few very difficult flashcards.










### Resources

- [Effective learning: Twenty rules of formulating knowledge](https://www.supermemo.com/en/articles/20rules)
- [Spaced repetition: Never forget vocabulary ever again](https://www.fluentin3months.com/spaced-repetition/)
- [Memorizing a programming language using spaced repetition software](https://sivers.org/srs)
- [Mind for Numbers(book)](https://www.amazon.com/Mind-Numbers-Science-Flunked-Algebra/dp/039916524X)
- [Detailed summary of the above book](http://www.fullerton.edu/LearningAssistance/Review-and-Summary-of-A-Mind-for-Numbers.pdf)
- [JANKI METHOD: Using spaced repetition systems to learn and retain technical knowledge.](http://www.jackkinsella.ie/articles/janki-method)
