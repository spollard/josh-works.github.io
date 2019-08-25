---
layout: post
title:  "LeetCode: Words From Characters, and Benchmarking Solutions"
date:  2019-08-23 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
description: "Benchmarking different solutions to LeetCode's 'Find Words That Can Be Formed By Characters' challenge"
tags: [ruby, benchmarking, code_challenge]
permalink: find-words-formed-by-characters-and-benchmarking
---

I recently worked through [a LeetCode problem](https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/). 

The first run was pretty brutal. It took (what felt like) forever, and I was not content with my solution.

Even better, it passed the test cases given while building the solution, but failed on submission.

So, once I fixed it so it didn't fail on submission... it then timed out. My code was so inefficient _leetcode's test suite took too long to finish_. 

I have a few learning objectives for doing this kind of code challenge:
- Improve my knowledge of Ruby's API
- Get better at benchmarking code "snippets". 
- Refresh/document my "process" for learning new things about a programming language, for the benefit of Turing students who are attacking their own code challenges. 

## The challenge and my (not quite working) solution.

Here's the given instructions:


> You are given an array of strings `words` and a string `chars`.
> 
> A string is good if it can be formed by characters from `chars` (each character can only be used once).
> 
> Return the sum of lengths of all good strings in words.
> 
> Example 1:
```
Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation: 
The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
```
> Example 2:
```
Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation: 
The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
```
> Note:
> 
```
1 <= words.length <= 1000
1 <= words[i].length, chars.length <= 100
All strings contain lowercase English letters only.
```

<!--more-->


There's a few things I struggled with; first, I was doing all of this in the LeetCode UI; I didn't get to use `pry` to pause code execution and quickly poke around internal state; I had to rely on liberal use of `print` statements, which is decidedly un-fun.

This lovely 13 lines of code took me probably a full hour. Yikes:

```ruby
def count_characters(words, chars)
  found_words = []
  words.each do |w|
    found_words << w if word_chars_in_approve_list(w, chars)
  end  
  return found_words.join.length
end

def word_chars_in_approve_list(word, chars)
  word.split("").all? do |c|
    chars.include?(c)
  end
end
```

I hit the "submit" button... it didn't pass. In the `word_chars_in_approve_list` method, I'm only checking to see that all of the characters in `word` also exist in the `chars` string. 

So if 
```
word = "bbb"
chars = "b"
```
the method returned true, even though it shouldn't have - per the instructions:
> each character can only be used once

So for the `word` of `bbb`, it would be valid only if the `chars` list had at least `3` instances of `b` in it:

```
word = "bbb"
chars = "bbb"
```

------------------------

So, I worked a bit with [Kunal Madhav](https://www.codementor.io/gando_001) from CodeMentor (I had a variety of questions for him, among them was this challenge and my general strategy for solving technical challenges. He was great. You should talk with him.)

Together, we eventually ironed out the following:

```ruby
def count_characters(words, chars)
    found_words = []
    words.each do |w|
        if word_chars_in_approve_list?(w, chars)
            found_words << w 
        end
    end
    return found_words.join.length
end

def word_chars_in_approve_list?(word, chars)
    word.split("").each do |c|
        if chars.include?(c)
            chars = remove_first_instance_of(c, chars)
        else
            return false
        end
    end
    return true
end

def remove_first_instance_of(c, chars)
    split_chars = chars.split("")
    index = split_chars.index(c)
    split_chars.delete_at(index)
    return split_chars.join
end

```

Lots of other solutions [available here](https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/discuss/?currentPage=2&orderBy=hot&query=)

But this code was _timing out_; this took too long to run. So, I figured out a modest performance improvement. Rather than splitting and joining the word so many times, I did it just once:

```ruby
def count_characters(words, chars)
  found_words = []
  words.each do |w|
  if word_chars_in_approve_list?(w, chars)
    found_words << w 
  end
  end
  return found_words.join.length
end

def word_chars_in_approve_list?(word, chars)
  list = chars.split("")
  word.split("").each do |c|
    if list.include?(c)
      index = list.index(c)
      list.delete_at(index)
    else
      return false
    end
  end
  return true
end
```

All the action is happening in the `word_chars_in_approve_list?` method.

The output from submitting it on LeetCode:
> Runtime: 832 ms, faster than 18.18% of Ruby online submissions for `Find Words That Can Be Formed by Characters`.
Memory Usage: 10.2 MB, less than 100.00% of Ruby online submissions for `Find Words That Can Be Formed by Characters`.

So, the above code worked, but I didn't really feel like it was good code.

-----------------------------

The next day, I wanted to revisit this. I recommend to Turing students _all the time_ to write code down in a notebook, and re-build the solution/class/whatever from their notebook.

So, I'm taking a dose of my own medicine:

I made some improvements from a readability perspective:

```ruby
def count_characters(words, chars)
  words.reduce(0) do |results, word|
    results += word.length if word_in_chars?(word, chars)
    results
  end
end

def word_in_chars?(word, chars)
  char_list = chars.split("")
  word.split("").each do |c|
    if char_list.include?(c)
      char_list.delete_at(char_list.index(c))
      next
    end
    return false
  end
  true
end
```

And the above solution vs. the below solution is what I want to benchmark:

```ruby
def count_characters(words, chars)
    found_words = []
    words.each do |w|
        if word_chars_in_approve_list?(w, chars)
            found_words << w 
        end
    end
    return found_words.join.length
end

def word_chars_in_approve_list?(word, chars)
    word.split("").each do |c|
        if chars.include?(c)
            chars = remove_first_instance_of(c, chars)
        else
            return false
        end
    end
    return true
end

def remove_first_instance_of(c, chars)
    split_chars = chars.split("")
    index = split_chars.index(c)
    split_chars.delete_at(index)
    return split_chars.join
end
```

## Benchmarking Code Snippets

LeetCode offers pretty detailed benchmarking, but I wanted to see exactly how bad my "too slow" solution was. 

So, I spun up a little benchmark. 

In ruby, you can do something like this:

```ruby
require 'benchmark'

def count_characters(words, characters)
  # first version of code you want to test
end

def count_characters_medium(words, characters)
  # second version of code to test
end

def count_characters_fast(words, characters)
  # third version of code to test
end

Benchmark.bmbm do |x|
  iterations = 30000
  words = ["cat", "hat", "ball", "sasafras"]
  characters = "catbl"

  x.report("slower") { 
    iterations.times do |foo|
      count_characters(words, characters)
    end
  }

  x.report("medium") { 
    iterations.times do |foo|
      count_characters_medium(words, characters)
    end
  }
  
  x.report("faster") { 
    iterations.times do |foo|
      count_characters_fast(words, characters)
    end
  }
end
```

Include the code you want to test before declaring `Benchmark`, and this benchmark code will run the given arguments through the associated methods. 

When I used small strings, it was not easy to tell which code was faster. I was running it 30000+ times, and was getting output showing only a small difference.

But then I ran it on the input LeetCode was providing, and I got much more interesting results:

```
Rehearsal -------------------------------------------
slower   13.530000   0.080000  13.610000 ( 14.094186)
medium    2.120000   0.020000   2.140000 (  2.453419)
faster    1.700000   0.010000   1.710000 (  1.725038)
--------------------------------- total: 17.460000sec

              user     system      total        real
slower   13.160000   0.050000  13.210000 ( 13.371204)
medium    1.740000   0.010000   1.750000 (  1.759786)
faster    1.810000   0.010000   1.820000 (  1.888091)
```

My "slow" code was taking a bit more than seven times as long to run as the "faster" code. That's a noteworthy improvement.

### Additional Resources

- [Benchmark in Ruby code using bm and bmbm with examples](https://rubyinrails.com/2013/09/13/benchmark-in-ruby-code-using-bm-and-bmbm-with-examples/)
- [Benchmark API (RubyDoc)](https://ruby-doc.org/stdlib-2.6.3/libdoc/benchmark/rdoc/Benchmark.html#method-c-bmbm)
- [My full "test" file, with extremely long test input](https://github.com/josh-works/josh-works.github.io/blob/master/code_snippets/find-words-formed-by-characters.rb)