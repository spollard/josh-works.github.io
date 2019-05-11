---
layout: post
title:  "Turing Prep appendix: Troubleshooting Errors"
date:  2019-04-24 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-03-mythical-creatures
---



## troubleshooting errors

As you run into problems (and others) let me know. I'd like to collect a broad swath of the errors folks run into, and the solutions, so they don't get too caught up.

## `Traceback... cannot load such file -- pry`

This seems like an intimidating error message at first. 

It's not. The error just says:

> Dear user, you've asked me to import code to run these tests, but I cannot find the code you require. 
>
> The code I was looking for (and cannot find) is called `pry`

Pry is an amazing tool. You'll soon come to love it. In the mean time, just install it. It's a ruby "gem" so you use the `gem install <gem_name>` command.

In your terminal, run `gem install pry` and then run the tests again. 

## Cannot open atom from the terminal

#### Install Atom Shell Commands

Atom makes it super easy to do this:

![install shell commands](https://cl.ly/c774fbf6ae66/2018-09-14%20at%203.44%20PM.jpg)

#### `FSPathMakeRef` and a bunch of other stuff

Here's an error one student saw:

`FSPathMakeRef(/Applications/Atom.app) failed with error -36.`

Googling around lead here: https://github.com/atom/atom/issues/5222

One possible cause was the user's machine had two instances of `Atom.app` on it. (In this case, one was in the `Downloads` folder, the other in `Applications`. Delete one of them, try again.


