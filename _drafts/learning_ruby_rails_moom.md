---
layout: post
title:  "Mastering Object Oriented Rails - MOOM with Avdi"
date:  2018-08-06 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [moom, rails, ruby]
permalink: moom_lessons_01
---


Byebug vs. pry?

telnet?

git add --patch (same as -p)

https://thehelpfulhacker.net/2009/11/14/stupid-telnet-tricks/

<!--more-->


# Q&A with Avdi and guest Betsy Haibel (video)

Video: https://avdi.codes/topic/qa-1-with-guest-betsy-haibel/

Forums, Q&A: https://discuss.avdi.codes/t/q-a-1-with-guest-betsy-haibel/496/5

This is super exciting because lots of these projects/topics are relevant to the Threatsim applications!

### How to do fast tests

####  no-Rails tests?

Only works if dependency arrows goes a single direction. 

Pain of slow tests is telling me that rails is bad, code is bad. It's that Rails/objects are solving different problems? 

Slow tests == lots of connections between rails under hood, and my business logic. 

_how do you define slow tests? Lots of quick tests still may be "slower" than fewer, slower tests_. 

Theme of separating business logic from Rails vis POROS. 

Primary ill of bad tests is maintenance headaches down the road (to me)

#### feature/integration/acceptance tests

These will be slow, no matter what. 

Try to use VCRs if calling external APIs. 

_you can throw tests away_. (wuuuuuut. never thought of this.)

## Find common themes in slow tests? Speed up test suite?


# MOOM Week 2: Representing User Input


# Primitive Obsession

TL;DR don't store domain objects as primitives. `course.duration` => `3`. 3 what? weeks? days? months?






# misc, try setting up w/team:

Pairing/chats of three types:

1. I watch them
2. They watch me
3. 1:1 with ranging topics/"non-technical" agenda/discussion
