---
layout: post
title:  "Array divergence in Ruby"
date:  2018-02-02 06:00:00 -0700
crosspost_to_medium: true
categories: [ruby]
tags: [ruby, rails]
permalink: array-divergence
---

Lets say you have a list of valid items, and you want to run another array against it, and pull out the items that don't match.

You don't want to iterate through all of the items in one array, calling `other_array.include?(item)`. (That's computationally expensive)

```ruby
valid_people = ["Sarah Connor", "John Connor"]

visitor_logs = ["Sarah Connor", "John Connor", "Terminator Robot"]
```

You want to find any item in `visitor_logs` that isn't on the approved list. How to do that?

in Ruby, you can just "subtract" one array from another:

```ruby
unwanted_visitors = visitor_logs - valid_people
=> ["Terminator Robot"]
```


<!--more-->

What if you want to see what items on both lists are _not_ in common? (AKA _divergence_)

You'll use Ruby's `uniq` operator, which is `|`

Lets say you're a _really_ aggressive party host. When you invite people, they'd better show up. And if someone DOES show up who's not invited, they're in trouble too.

So, you've got `expected_guests` and `actual_guests`. You need to figure out who in each list isn't on the other one. Maybe you'll rick roll them later for their error. Here's how you'd do that:

```ruby
expected_guests = ["Sarah", "John", "The Hulk"]
actual_guests = ["Sarah", "John", "Dracula"]

expected_guests - actual_guests
=> ["The Hulk"]

actual_guests - expected_guests
=> ["Dracula"]

(expected_guests - actual_guests) | (actual_guests - expected_guests)
=> ["The Hulk", "Dracula"]
```
Looks like you're [rick rolling](https://www.youtube.com/watch?v=dQw4w9WgXcQ) The Hulk, and Dracula. Good luck!


The above operation is the same as:

```ruby
list_1 = [1, 2, 3]
list_2 = [2, 3, 4]

[1, 2, 3] | [2, 3, 4]
=> [1, 2, 3, 4]
```




### Additional Reading

- [Stack Overflow: Find element not in common for two arrays](https://stackoverflow.com/questions/20205023/ruby-find-element-not-in-common-for-two-arrays)
- [Christian Rolle: Array Coherences](http://www.chrisrolle.com/en/blog/array-coherences)
