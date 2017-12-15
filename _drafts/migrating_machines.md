---
layout: post
title:  "Moving to a new computer - some notes"
date:  2017-11-27 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [mac, upgrades]
permalink: moving-to-a-new-computer
---

As I start a new job with Wombat Security (woo!), they sent me a new macbook pro.

One of the cool side effects of working in tech is people seem to regularly give you equipment, food, and swag. Brand new laptop? Cool!

It's a work machine, though, so I'll be using it for work, but maintaining my older laptop for personal use.

That all said, developers are notoriously fickle about their laptops, and I was *dreading* the process of migrating dozens of programs and settings and tiny little configurations from my old computer to my new one.

Some of what I've learned will live in this guide, to serve me again later.


<!--more-->

Mac's migration assistant is incredible. I can basically clone all of my old programs, settings, licenses, and permissions from the old machine to the new one.

Out of the box, almost everything worked perfectly.

## AlfredApp

I couldn't actually use my new computer until I got Alfred working. I had to re-enter my product key, but once I did, all of my workflows were back up and running.

## 1Password

1Password made the jump without a hiccup.

## Dropbox

I had to re-signin to the desktop app, and I was good to go.

## Backblaze

I use backblaze for backing up my machine. It detected a large change in the backup content, and [asked that I uninstall, reinstall, and re-license the tool](https://help.backblaze.com/hc/en-us/articles/217666178-Safety-Freeze-Your-Backup-is-Safety-Frozen-) on my new machine. Pretty painless.

## Siel and Karabiner

I map my caps lock key to delete. I had to futz around a bit with `Karabiner` and `Seil` to get it mapped again, and my [old guide]({{ site.baseurl }}{% link _posts/2014-07-16-stop-yelling-on-the-internet-or-a-better-use-for-the-caps-lock-key.md %}) wasn't quite current. To be honest, two days later I forgot what I had to do to make it work, but... google around. Any article from 2017 is good.

# Programming

iTerm made the jump, all of my SSH keys still work, Github still knows who I am, and I didn't have to re-credential anything. This is a bit surprising, but I'm not complaining.

## RVM

I had to re-install X-Code's command line tools to use RVM.

```
$ xcode-select --install
```

and RVM was happy again to install new versions of Ruby.

## Touchbar

Oof. I don't like the touch bar so far. I like hitting buttons and feeling them work. More on this soon.
