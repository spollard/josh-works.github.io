---
layout: post
title:  "Sidekiq and Background Jobs for Beginners"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [ruby, rails, sidekiq, background_jobs]
permalink: sidekiq-and-background-jobs-in-rails-for-beginners
---

I've recently had to learn more about background jobs (using Sidekiq, specifically) for some bugs I was working on.

I learned a lot. Much of it was *extremely* basic. Anyone who knows much at all about Sidekiq will say "oh, duh, of course that's true", but... it wasn't obvious to me.

The reason I needed such basic overviews is because prior to my current job, I'd had just a few _hours_ of exposure to background jobs, and understood little of those hours. And I got dropped into a project that has dozens of jobs, handling hundreds of thousands of actions a day. 

As is my style, when I don't understand something, I like to go to the very basics...

<!--more-->

I went back to Turing! I found our [background jobs lesson](http://backend.turing.io/module3/lessons/intro_to_background_workers), and worked through it.

It only 


Doing the tutorial

Adding procfile 

redis cli

add `ChatWorker`, Rails Logger, test all this?