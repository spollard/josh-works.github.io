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

This is crazy:

```ruby
class Duration
  attr_reader :magnitude
  
  def initialize(magnitude)
    @magnitude = magnitude
    freeze
  end
  
  def inspect
    "#{self.class}[#{magnitude}]"
  end
  
  def to_s
    "#{magnitude} #{self.class.name.downcase}"
  end
  
  alias_method :to_i, :magnitude
end


class Days < Duration; end
class Weeks < Duration; end
class Months < Duration; end
```
And it delivers pretty cool stuff:

```
main:0> Days.new(3)
=> Days[3]
main:0> Days.new(3).to_s
=> "3 days"
main:0> length = Weeks.new(3)
=> Weeks[3]
```


But having the option to call `course.length` and get `Weeks[3]` as a response is... amazing. Or `course.length.to_s` and get `3 weeks`. Super cool. 


# You don't have users

Don't call anything in your system a "user". That is endlessly confusing. Is it someone with billing access? Is it a member of an account assigned to that bill-paying person who does _not_ have billing access? There's a natural segmentation of roles you may expect to assign to people who use your platform, so don't call them users. 

(For example, where I work, a "user" is considered to be an admin-type person that you need to check their role before you know what they can actually do.)




# misc, try setting up w/team:

Pairing/chats of three types:

1. I watch them
2. They watch me
3. 1:1 with ranging topics/"non-technical" agenda/discussion
