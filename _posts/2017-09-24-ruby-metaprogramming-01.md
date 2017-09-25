---
layout: post
title:  "Metaprogramming in Ruby: method_missing"
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
# hamming_test.rb
  # ...
  def test_identical_strands
    assert_equal 0, Hamming.compute('A', 'A')
  end
  # ...
```

my working solution (in regular, non-metaprogramming ruby), is:

```ruby
# hamming.rb
# ...
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
# ...
```

It's a simple class method, takes two arguments, and even has an enumerable anti-pattern of using a counter outside the loop. This solution of mine is many months old, I'm not going to refactor that `#each_with_index` method. I know it's itching for a `#reduce`, but let's metaprogram it instead.

<!--more-->

I'm going to implement a 'method_missing' metaprogramming approach. I'm going to experiment with how Ruby throws "method missing" errors, and try to creatively break it.


### My Constraints

I want to make all of the tests pass without using `::compute` anywhere, and without modifying [the test file](https://gist.github.com/josh-works/aaaf1a65f9d60c602f91f5b21dc38c82) at all.

```ruby
# hamming.rb
class Hamming
  def self.method_missing(method, *args)
    p method
    p args
    # `method` will be anything I want it to be
    # args is just an array of any given arguments
  end
end

```

With the above snippet, you can jump into a Pry or IRB session and require the file (enter `$ pry -r ./hamming.rb` in your terminal to open the file in a Pry session...) and enter the following:
```
Hamming.compute('A', 'A')
=> :compute
=> ["A", "A"]
```
When you call a method on an object, Ruby looks up the "inheritance chain" all the way to `BasicObject`. To see what the inheritance chain is for our `Hamming` class, try:

```
Hamming.ancestors
=> [Hamming, Object, Kernel, BasicObject]
```

When you call a method that isn't part of the `Hamming` class, Ruby will look to see if it exists in `Object`, `Kernel`, and `BasicObject`. `BasicObject` has a private method called `method_missing` ([method_missing docs](https://ruby-doc.org/core-2.4.2/BasicObject.html#method-i-method_missing)), and will call it on whatever object started the whole fiasco. In this case, it will be called on `Hamming`.

You can call `method_missing` yourself:

```
Hamming.send(:method_missing, :imaginary_method)
NoMethodError: undefined method `imaginary_method' for Hamming:Class
```

`send` does a few things, but one of them is lets you call private methods. Useful, since `method_missing` is a private method.

Now, this gets us some of the way to a solution.

I can simply re-label my method, make a few changes to pluck the first and second arguments from `args`, and I'm in business:

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
Since the `Hamming` class doesn't have a `compute` method, when my test file calls this non-existent method, it eventually ends up with `BasicObject` calling `method_missing`, which I've now over-ridden to give me this particular output.

A very obvious problem is now *every* method that I might call that doesn't exist will get passed into this replacement `compute` method, and will return all sorts of errors.

For example, the following method calls all give the same error:

```
Hamming.compute()
Hamming.c
Hamming.why_wont_you_work

=> NoMethodError: undefined method `length' for nil:NilClass
```
Fortunately, we can add one more element to "scope" the kind of missing method errors we're intercepting. That would aid future developers who won't be quite as flummoxed by this random error code.

```ruby
def self.method_missing(method, *args)
  super unless %w[compute].include? method.to_s
  raise ArgumentError if (args[0].length != args[1].length)
  # ...
```

`super` ([docs](https://ruby-doc.org/docs/keywords/1.9/files/keywords_rb.html#M000034)) passes the call along to the parent object if certain conditions are/are not met. In this case, we're passing the `method_missing` call up the inheritance chain _unless_ the method matches a list we give it.

-------------------------

This passes all the tests! It's horrible code, but was an educational journey for me.

Oh, and lets just switch to a `#reduce` real quick. My eye is twitching:

```ruby
class Hamming
  def self.method_missing(method, *args)
    super unless %w[compute].include? method.to_s
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
