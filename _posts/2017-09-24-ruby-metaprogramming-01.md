---
layout: post
title:  "Metaprogramming in Ruby: Method Missing"
date:   2017-09-24
published: true
crosspost_to_medium: true
categories: [ruby, programming]
tags: [ruby, programming, metaprogramming, exercism]
permalink: metaprogramming-method-missing-01
---

I'm working through [Metaprogramming in Ruby](https://www.amazon.com/Metaprogramming-Ruby-Program-Like-Facets/dp/1941222129)

It's a great read. There are examples in the books, but I wanted to take them out and apply them to some easy [Exercisms](http://exercism.io/).

I feel some disclosure may be useful. _In no way, at all, should you ever implement any of the "solutions" I'm exploring here. I'm intentionally breaking things and doing them wrong to grow my understanding of how Ruby works._

If you're following along, I'm doing the `hamming_test.rb` Exercism. It's got a few tests. Here's the first one:

```ruby
def test_identical_strands
  assert_equal 0, Hamming.compute('A', 'A')
end
```

my working solution (in regular, non-metaprogramming ruby), is:

```ruby
def self.compute(string1, string2)
  raise ArgumentError if (string1.length != string2.length)
  counter = 0
  string1.split('').each_with_index do |char, index|
    if char != string2[index]
      counter += 1
    end
  end
  counter
end
```

It's a simple class method, takes two arguments, and even has an enumerable anti-pattern of using a counter outside the loop. This solution of mine is many months old, I'm not going to refactor that `#each_with_index` method. I know it's itching for a `#reduce`, but let's metaprogram it instead.

<!--more-->

I'm going to take the 'method missing' metaprogramming approach. I'm going to experiment with how Ruby throw's "method missing" errors, and try to creatively break it.

I want to make all of the tests pass without using `::compute` anywhere.

```ruby

class Hamming
  def self.method_missing(method, *args)
    p method
    p args
    # `method` will be anything I want it to be
    # args is just an array of any given arguments
  end
end

```

With the above snippet,
```
Hamming.compute('A', 'A')
=> :compute
=> ["A", "A"]
```

So, I can simply re-label my method, make a few changes to pluck the first and second arguments from `args`, and I'm in business:

```ruby
class Hamming
  def self.method_missing(method, *args)
    raise ArgumentError if (args[0].length != args[1].length)
    counter = 0
    args[0].split('').each_with_index do |char, index|
      if char != args[1][index]
        counter += 1
      end
    end
    counter
  end
end
```

This passes all the tests! It's horrible code, but was an educational journey for me.

Oh, and lets just switch to a `#reduce` real quick. My eye is twitching:

```ruby
class Hamming
  def self.method_missing(method, *args)
    raise ArgumentError if (args[0].length != args[1].length)
    args[0].split('').each_with_index.reduce(0) do |counter, (char, index)|
      counter += 1 if char != args[1][index]
      counter
    end
  end
end
```

There. Slightly better.

That's it for now. A small journey into one metaprogramming concept. More soon!
