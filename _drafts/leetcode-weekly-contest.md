---
layout: post
title:  "LeetCode: Find Words That Can Be Formed By Characters, and benchmarking"
date:  2019-08-19 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
description: "Benchmarking different solutions to LeetCode's 'Find Words That Can Be Formed By Characters' challenge"
tags: [ruby, benchmarking, code_challenge]
permalink: leetcode-find-words-formed-by-characters-and-benchmarking
---

I recently worked through [a LeetCode problem](https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/). 

The first run was pretty brutal. It took (what felt like) forever, and I was not conent with my code.

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
--------------------------------

There's a few things I struggled with; first, I was doing all of this in the LeetCode UI; I didn't get to use `pry` to pause code execution and quickly poke around internal state; I had to rely on libral use of `print` statements, which is decidedly unfun.

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

I hit the "submit" button, and it didn't pass. In the `word_chars_in_approve_list` method, I'm only checking to see that all of the characters in `word` also exist in the `chars` string. 

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

So, I worked a bit with [Kunal]() from CodeMentor (I had a variety of questions for him, among them was this challenge and my general strategy for solving technical challenges. He was great. You should talk with him.)

Together, we eventually ironed out;

\ # get slow code, add it

```ruby
def count_characters(words, chars)
  found_words = []
  words.each do |w|
    if word_chars_in_approve_list?(w, chars)
      found_words << w 
    end
  end
  p found_words
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

Lots of other solutions here:

https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/discuss/?currentPage=2&orderBy=hot&query=

But this code was _timing out_; this took too long to run. So, I figured out a modest performance improvement. Rather than splitting and joining the word so many times, I did it just once:

\ # get fast code, add it

```ruby
def count_characters(words, chars)
  found_words = []
  words.each do |w|
  if word_chars_in_approve_list?(w, chars)
    found_words << w 
  end
  end
  p found_words
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

-----------------------------

The next day, I wanted to revist this. I recommend to Turing students _all the time_ to write code down in a notebook, and re-build the solution/class/whatever from their notebook.

So, I'm taking a dose of my own medicine:

\ # include pictures of my hand-written notes

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
def count_characters_shift(words, chars)
  words.reduce(0) do |res, word|
    res += word.length if word_exist_in_char_shift?(word, chars)
    res
  end
end

def word_exist_in_char_shift?(word, chars)
  # I'm sorting both arrays here so I don't have to
  # find and delete by index later. I can just pop the
  # first item off the array.
  
  # note to self, this doesn't quite work. Fix tmr. 
  char_list = chars.split("").sort
  word_chars = word.split("").sort
  word_chars.each do |wc|
    next if char_list.shift == word_chars.shift
    return false
  end
  return true
end
```