---
layout: post
title:  "Mythical Creatures: Refactoring wizard.rb"
description: "Refactor practice, in which we will refactor wizard.rb, learn more about Ruby, object-oriented design, and clean code"
date:  2020-01-24 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [mythical_creatures, refactoring, ruby]
permalink: mythical-creature-refactor-wizard
image: /images/title_image.jpg
---

Today we're refactoring some code.

I find it _extremely_ fruitful when others look over my code and help me clean it up. Quite a few Turing students have told me that the process of refactoring their own code with the help of someone who knows a bit more than them has been super helpful.

This is an exercise from Turing School's [ruby-exercises](https://github.com/turingschool/ruby-exercises) repository. 

Specifically, we're refactoring a solution that makes [this test](https://github.com/turingschool/ruby-exercises/blob/master/mythical-creatures/test/wizard_test.rb) pass. 

## How to get the maximum value from this exercise

So far, I've found it most helpful to have _my own_ code refactored. I wish I could help every single person who might read this post refactor _their own code_. 

But I cannot. 

But here's the thing - when you're working, you'll often not be refactoring your own code either. It's most likely you'll be reading (and updating) code that someone else wrote. 

Or you'll be nestling in new code and new features alongside existing code and existing features. 

So it's useful to get practice reading other people's code, and being able to work with it. 

Copy-paste this code into your editor:

```ruby
class Wizard
  attr_reader :name
  def initialize(name, bearded: false)
    @name = name
    @rested = 0
  end
  def bearded?
    if name == "Ben"
      true
    else
      false
    end
  end
  def incantation(saying)
    "sudo " + saying
  end
  def rested?
    if @rested >= 3
      false
    else
      true
    end
  end
  def cast
    @rested += 1
    "MAGIC MISSILE!"
  end
end
```

run the tests against it. Make sure they pass. 

Now, just by reading this, I'm seeing an opportunity for [guard clauses](https://www.thechrisoshow.com/2009/02/16/using-guard-clauses-in-your-ruby-code/)

But I'll record my refactor for you!

<insert link to youtube video here>

<!--more-->

Here's the final version:

```ruby
class Wizard
  attr_reader :name, :bearded, :rested, :spell_counter
  def initialize(name, bearded: true)
    @name = name
    @rested = true
    @bearded = bearded
    @spell_counter = 0
  end
  
  def bearded?
    bearded
  end
  
  def incantation(saying)
    "sudo " + saying
  end
  
  def rested?
    return false if spell_counter >= 3 # this is a "guard clause", sorta
    rested
  end
  
  def cast
    @spell_counter += 1
    "MAGIC MISSILE!"
  end
end
```
