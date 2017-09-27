---
layout: post
title:  "Lambdas, Blocks, Procs, and crocs"
date:   2017-09-26
published: false
crosspost_to_medium: false
categories: [programming, ruby]
tags: [programming, ruby, metaprogramming]
permalink: lambdas-blocks-procs-crocs
---

_Continuing on from [yesterday's post about `method_missing`]({{ site.baseurl }}{% link _posts/2017-09-24-ruby-metaprogramming-01.md %}), I'm moving on to a part of Ruby's language that has been a bit of a mystery for me for quite some time. I'm still working through [Metaprogramming in Ruby](https://www.amazon.com/Metaprogramming-Ruby-Program-Like-Facets/dp/1941222129)._

It's the concept of _lambdas_, _procs_, _blocks_, and more. I also hope to better understand _closures_, and perhaps even some aspects of functional programming, as I'm used to (so far) thinking in OOP approaches.

I expect my first pass to be rocky, but to also lay a foundation for better understanding later. I'm writing this out because [this is how I learn]({{ site.baseurl }}{% link _posts/2017-06-04-learning-how-to-learn.md %}).  

Oh, and I cannot promise how crocs (and crocks) will feature in the following words.


<!--more-->

## yield

First new term: `yield`. [(docs)](https://ruby-doc.org/core-2.4.2/Proc.html#method-i-yield)

It is always related to passing blocks around (to methods, or other blocks, procs, etc). I think lots of what we do with blocks interacts with the `yield` function, but it gets called behind the scenes. (Sorta how `initialize` calls, among other things, `new`)

you can call `yield` from inside a method to see any block passed to it. You can also call `block_given?` to see if there's a block floating around anywhere.

```ruby
def a_method
  return yield if block_given?
  'no block'
end

a_method
=> "no block"

a_method {"look at me, I'm a block"}
=> "look at me, I'm a block"

a_method do
  "i'm inside a do..end block"
end
=> "i'm inside a do..end block"
```

Enough on yielding.

## Blocks are closures

So, what is a closure? Great question...

A block requires an environment to run inside of. An orphaned `do..end` block doesn't make sense.

The environment the block runs inside of has local variables, instance variables, a `self`, etc. (I'm copying heavily from _Metaprogramming Ruby 2_ here.) These variables are sometimes referred to as _bindings_. A block that has bindings is ready to run.

A block, with it's given bindings (which relate to its _scope_), is known as a _closure_.

_I don't yet know why_.

It seems like it's tricky for blocks to gain access to variables outside of their immediate context/scope.

To pass scopes around, you have to get past "Scope Gates", which is anything ruby method that starts with `class`, `module`, or `def`. You might think to yourself "that's all of them."

To sneak a binding through a scope gate, you'll have to use a block.

Compare:

```ruby
my_var = "success"
class MyClass
  p my_var, " from myClass"
  # can we access my_var from here?
  def my_method
    p my_var, " from my_method"
    # ... or here?
  end
end

# womp womp. run the code, and receive:
# blocks_practice.rb:15:in `<class:MyClass>': undefined local variable or method `my_var' for MyClass:Class (NameError)
```
(you cannot access `my_var` inside of the class or method. Those methods start with the scope-gated phrase `class` and `def`)

```ruby
my_var = "success"

MyClass = Class.new do
  # we can access my_var from here!
  puts "#{my_var} from myClass"

  def my_method
    # ... but not from here
    puts "#{my_var} from my_method"
  end
end

# MyClass.new.my_method
# NameError: undefined local variable or method `my_var' for #<MyClass:0x007f98c93f0980>
```

```ruby
my_var = "success"

MyClass = Class.new do
  # we can access my_var from here!
  puts "#{my_var} from myClass"

  define_method :my_method do
    # ... but not from here
    puts "#{my_var} from my_method"
  end
end

# MyClass.new.my_method
# => "success from my_method"
```

I feel like there's something important here, but I don't yet know what it is. But I'm not worrying about it - this is my first trip through closures in Ruby, and I'm only half way through the chapter!

Per how I [like to learn]({{ site.baseurl }}{% link _posts/2017-06-04-learning-how-to-learn.md %}), I'm going to dig into some associated guides/tutorials for the concept of closures in Ruby. I know it's tied to functional programming, and I think it'll be useful to me to wrap my head around the idea.

------------------

Oh yeah, I promised crocs, right?

<div style="width:100%;height:0;padding-bottom:56%;position:relative;"><iframe src="https://giphy.com/embed/XJy7i9KfXxYyc" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/statechamps-crocs-state-champs-XJy7i9KfXxYyc">via GIPHY</a></p>

### May your code always look better than the shoes, and never bite you on the behind like a crocodile.

<div style="width:100%;height:0;padding-bottom:100%;position:relative;"><iframe src="https://giphy.com/embed/3skd1byCM2E4U" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><p><a href="https://giphy.com/gifs/jump-interesting-crocodiles-3skd1byCM2E4U">via GIPHY</a></p>



## Further reading
- [Begin, Rescue and Ensure in Ruby? (StackOverflow)](https://stackoverflow.com/questions/2191632/begin-rescue-and-ensure-in-ruby)
- [Weird Ruby Part 2: Exceptional Endurance (New Relic)](https://blog.newrelic.com/2014/12/10/weird-ruby-2-rescue-interrupt-ensure/)
- [Closures in Ruby (Site Point)](https://www.sitepoint.com/closures-ruby/)
- [Understanding Ruby Closures (scotch.io)](https://scotch.io/tutorials/understanding-ruby-closures)
