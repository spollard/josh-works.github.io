---
layout: post
title:  "Primitive Obsession & Exceptional Values"
date:  2018-10-12 06:00:00 -0700
crosspost_to_medium: true
categories: [ruby]
tags: [ruby, rails, learning]
permalink: primative-obsession-and-exceptional-values
---

I've been working through Avdi Grimes' [Mastering the Object Oriented Mindset](https://avdi.codes/moom/) course.

One of the topics was using "whole values", instead of being "primative obsessed". The example Avdi gave was clear as day. 

He used a course with a `duration` attribute to show the problem. 

```ruby
course.duration 
=> 3
```

3 what? weeks? days? months?

Of course, you could write a method like:

```ruby
course.duration_in_weeks
=> 3
```

But now you'll have trouble rendering this all over the place. You'd have conditionals every time you wanted to render courses in weeks (if it makes sense), or in months (if appropriate), or of course, days. 

So, the solution is to use "Whole values". This means an attribute should be a complete unit, in and of itself, and should need no further refining to be usable. 

So, you should be able to do something like this:

```ruby
course.duration
=> Months[3]
shorter_course.duration
=> Weeks[5]
```
<!--more-->

![mind blown](https://media.giphy.com/media/26ufdipQqU2lhNA4g/giphy.gif)

So, here's the basics of this `Duration` class, that your units (like `Days`, `Weeks`, and `Months`) inherit from: 

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


But having the option to call `course.duration` and get `Weeks[3]` as a response is... amazing. Or `course.length.to_s` and get `3 weeks`. Super cool.

Avdi walked through the example code, but I was partial to having it available for playing around myself. So, I built a very simple test file. 

[Check out the full test suite, if you're interested](https://gist.github.com/josh-works/6eb437670b66a67675c23352c787e66d)

The above gist also has the code that makes it all pass. I'm going to highlight just a few of the tests below:

```ruby
def test_duration_is_months_object
  assert_instance_of Months, @math.duration
end
```

This test (and a few others) make it explicit that when you call `@math.duration` you don't expect a primitive back - you expect an instance of the `Months` class. Super cool.

```ruby
def test_duration_inspect
  assert_equal "Months[4]", @math.duration.inspect
end
```

We can "convert" our Duration value into a primitive (a string) by calling `#inspect` on it. Other than this, though, the duration value lives as its own object. 

The tests test some helper methods that Avidi mentioned, to make it a bit easier to render the `course.duration` in a view:

```ruby
def render_course_info(course)
  "#{course.name} (#{render_value(course.duration)})"
end

def render_value(value)
  case value
  when Months
    "#{value.to_i} gruling months"
  when Weeks
    "#{value.to_i} delightful weeks"
  when Days
    "a paultry #{value.to_i} days"
  end
end
```

# Exceptional Values

So, we've got this method that takes input as a string, like "12 months", and tries to convert it to `Months[12]`. 

If you are accepting data from a user, you'll need to plan on invalid input, like "99 blinks". 

Here's the first take of the conversion method:

```ruby
def Duration(raw_value)
  case raw_value
  when Duration
    raw_value
  when /\A(\d+)\s+months\z/i
    Months[$1.to_i]
  when /\A(\d+)\s+weeks\z/i
    Weeks[$1.to_i]
  when /\A(\d+)\s+days\z/i
    Days[$1.to_i]
  else 
    nil
  end
end
```

This kind of works, but `nil` isn't a great place-holder. Now your view logic needs to do all sorts of special work to handle if there are `nil` values, which of course there will be all the time, because if you call:

```ruby
course = Course.new
course.name = "math"
course.duration = "12 days"
course.save
```

The course _will have nil values auto-assigned_ simply because the user has not filled it in  yet. 

Anyway, so, as you might expect from someone talking about "whole values", there's a "whole value" implementation of an exception:

```ruby
def Duration(raw_value)
  case raw_value
  when Duration
    raw_value
  when /\A(\d+)\s+months\z/i
    Months[$1.to_i]
  when /\A(\d+)\s+weeks\z/i
    Weeks[$1.to_i]
  when /\A(\d+)\s+days\z/i
    Days[$1.to_i]
  else 
    ExceptionalValue.new(raw_value, reason: "unrecognized format")
    # we create a new Exceptional Value object if we get unrecognized input
  end
end
```

Here's what that object might look like, using this exceptional value:

```ruby
math = Course.new("Math")
math.duration = "a blink of an eye"
=> <struct Course
 name="Math",
 duration=<ExceptionalValue:0x00007fca79021188 @raw_value="a blink of an eye", @reason="unrecognized format">>
```

pretty cool, huh? 

[check out the gist for tests and class code. Don't judge me for sticking like 40 classes in the same file...](https://gist.github.com/josh-works/6eb437670b66a67675c23352c787e66d)