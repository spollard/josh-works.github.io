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

_Continuing on from [yesterday's post about `method_missing`]({{ site.baseurl }}{% link _posts/2017-09-24-ruby-metaprogramming-01.md %}), I'm moving on to a part of Ruby's language that has been a bit of a mystery for me for quite some time. I'm still working through [Metaprogramming in Ruby](https://www.amazon.com/Metaprogramming-Ruby-Program-Like-Facets/dp/1941222129)_

It's the concept of _lambdas_, _procs_, _blocks_, and more. I also hope to better understand _closures_, and perhaps even some aspects of functional programming, as I'm used to (so far) thinking in OOP approaches.

I expect my first pass to be rocky, but to also lay a foundation for better understanding later. I'm writing this out because [this is how I learn]({{ site.baseurl }}{% link _posts/2017-06-04-learning-how-to-learn.md %}).  

Oh, and I cannot promise how crocs (and crocks) will feature in the following words.


<!--more-->

## yield

First new term: `yield`. [(docs)[https://ruby-doc.org/core-2.4.2/Proc.html#method-i-yield]]

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



## Further reading
- [Begin, Rescue and Ensure in Ruby? (StackOverflow)](https://stackoverflow.com/questions/2191632/begin-rescue-and-ensure-in-ruby)
- [Weird Ruby Part 2: Exceptional Ensurance (New Relic)](https://blog.newrelic.com/2014/12/10/weird-ruby-2-rescue-interrupt-ensure/)
