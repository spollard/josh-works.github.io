---
layout: post
title:  "Title"
description: "description about this post"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [category]
tags: [tag1, tag2]
permalink: perma_link
image: /images/title_image.jpg
---

I'm reading through [Practical Object Oriented Design in Ruby ](https://www.goodreads.com/book/show/13507787-practical-object-oriented-design-in-ruby)

These are some notes from the chapter; mostly these are for me, and they don't intend to stand on their own. Read the book, work through chapter six, and _then_ come back and read through this. 


Here's some snippets from chapter 6. 

The current state of the code is we have this `RoadBike` thing and `MountainBike` thing that share significant code. We're going to extract common functionality into the `Bycycle` superclass. Step one, according to Sandi Metz, is _always move code from the base class to super class_, never start with code in the super class.

```ruby
class Bicycle
  # Please note how empty this class is.
end

class MountainBike < Bicycle
  attr_reader :size, :front_shock, :rear_shock
  def initialize(args)
    @size         = args[:size]
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end
  
  def spares
    { chain:      '10-speed',
      tire_size:  '2.1',
      rear_shock: rear_shock
    }
  end
end

class RoadBike < Bicycle
  attr_reader :size, :tape_color
  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end
  
  def spares
    { chain:      '10-speed',
      tire_size:  '23',
      tape_color: tape_color }
  end
end

mtb = MountainBike.new(
  size:        'small',m
  front_shock: 'manitou',
  rear_shock: 'fox'
)
road = RoadBike.new(
  size:       'large',
  tape_color: "Red",
)
```

We have three broad goals:
1. Clean up the initialization methods, so the sub-classes have sensible defaults
2. Clean up the `spares` method, so sub-classes have sensible defaults
3. Accomplish 1 and 2 in such a way that the next developer who adds a sub-class doesn't have to inspect the existing classes in great detail to figure out subtle nuance. 

<!--more-->

------------------------

## First, a sub-optimal refactor

Turning it into a solid bit of abstraction, first with adding `size` to the `Bicycle` superclass:

```ruby
class Bicycle
  attr_reader :tire_size
  def initialize(args)
    @tire_size = args[:tire_size] || default_tire_size
  end
  
  def default_tire_size
    '2.1'
  end
end
```

and we have to call `super` from the sub-class initialize method:

```ruby
class MountainBike < Bicycle
  attr_reader :size, :front_shock, :rear_shock
  def initialize(args)
    @size         = args[:size]
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
    super(args) # we need this to get @size from the superclass. 
  end
```

Problem, though. Now every new subclass that we make needs to call `super` after being initialized. That's a subtle requirement, and not one that will be immediately apparent to future developers. 

## Using `post_initialize` instead of `initialize`

So, to navigate this requirement that subclasses call `super`, we'll strip our entire `initialize` method out of our subclass. 

Here's what we end up with next:

```ruby
class Bicycle
  attr_reader :tire_size
  def initialize(args)
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end
  def post_initialize(args)
    nil
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock
  def post_initialize(args)
    @front_shock  = args[:front_shock]
    @rear_shock   = args[:rear_shock]
  end
  .
end
```
OK, that works. No calls to `super`, and we get this nice `default_size` method available to us. 

# The `Template Method` Pattern

I had to read this chapter four or five times before it all sunk in, then I had to manually convert the classes from "tightly coupled and bad" to "appropriately abstract" three or four times for this to all sink in, at the _very basic level of this example_. 


Anyway, this `Template Method Pattern` seems to mean:

> Where abstract superclasses and their sub-classes share methods, the superclass must be explicit about what the subclasses must do. 
> 
> If the superclass provides a globally-available method (like some default value) that _can_ be overridden (or 'specialized') by the sub-class, no further action need be taken by the superclass
> 
> If the superclass _requires_ a method value (like the subclass providing some specific default value or specialization) it ought to raise an error if that default value is not specialized. 
> 
> Is it a rule of thumb that the subclasses never have an `initialize` method? it seems the superclass will call the subclasses with some sort of `post_initialization` method, rather than the subclasses calling `super` after initializing themselves. 
> 
> Subclasses ought to provide _specializations_ on the superclass, rather than ever overriding specific superclass attributes. 


I'd love to come up with a repository of drills or exercises to practice refactoring code according to this `Template Method` design pattern.

