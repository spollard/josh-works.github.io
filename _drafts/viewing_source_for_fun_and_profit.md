---
layout: post
title:  "Exploring Gems for Fun and Profit"
date:  2019-01-14 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails, programming]
permalink: exploring-gems-for-fun-and-profit
---

A software developer can reasonably expect to see stack traces _all day long_. (Right? It's not just me?)

I've been working with Ruby and Rails for a few years now, and so far, every time my code doesn't do what I want it to do, it's been my fault. 

I spend most of my day looking at code I've written, or code someone else on my team/affiliated with Wombat has written. 

Further, I know that to get better in pretty much any domain, it's fruitful to examine the work done by the masters, the experts. 

## I want to figure out how to quickly dive deep into methods defined in the Ruby, Rails, and gems.

For example, if I write a class with a method inside, and pass it bad data, and everything breaks, I can just open up the class in my editor, find the method, and figure out what's going on. 

But when Devise throws errors around `current_user`, I cannot quickly jump into the Devise source code to see what it's trying to do - I'd like to fix this. 

Furthermore, I'll become a better developer by soaking myself in the well-written code that is a part of the tools I use every day. 

# Viewing a Gem source

In some Googling around, I found this StackOverflow post: [Viewing a Gem's Source Code](https://stackoverflow.com/questions/10453249/viewing-a-gems-source-code).

So, lets try some of the recommended steps.

When I do `gem list`, I get back 282 gems. Scrolling through the list, I think I want to explore... `activerecord`. 

Another way, closer to what I was hoping for: https://stackoverflow.com/a/10453545/3210178

```
# get the `gem-open` gem:
gem install gem-open

gem open activerecord

```

## What are `rdocs`? 

Ruby Docs are called `rdocs`. They seem to be Important. Not sure why yet. 


### Resources

- [Viewing a Gem's Source Code (StackOverflow)](https://stackoverflow.com/questions/10453249/viewing-a-gems-source-code)
- []()