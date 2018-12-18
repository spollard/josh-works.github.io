---
layout: post
title:  "How I [use] Slack at Work"
date:  2018-12-17 06:00:00 -0700
crosspost_to_medium: false
categories: [category]
tags: [tag1, tag2]
permalink: how-i-use-slack-at-work
---

Slack. 

It's the thing Twitter freaks out about when it goes down, and a frightening amount of the world's software companies are entirely reliant upon. 

Slack is powerful. It's also dangerous. It can be _extremely_ distracting, so it's best to treat it like a really sharp knife that possesses some independent intelligence. It's not benign, but it is what we have right now. I prefer it to all the other chat tools (Gitter, HipChat, IRC) and in general, I prefer it to email. 

I'd be comfortable making much heavier use of long-form text tools, like Basecamp, but I'm in the minority there, so... here's how I try to make Slack work for me, and not against me. 

First, the context:

- I work 100% remotely, so the _vast_ majority of communication with my coworkers happens in Slack. The rest is split between Zoom and Jira comments. A tiny, tiny fraction happens in email. 
- Slack isn't a perfect replacement for real-time communication, but used well and in a healthy company culture, it can serve a very useful purpose quite well.

Second, my high-level philosophy that I'm seeking to communicate with the following principles:

- Slack tries to shred your ability to maintain sustained focus on anything. If you can fix this disposition, it might become useful. 
- Slack is dangerous when conversations start happening "quickly". This penalizes those who are not reading as the conversation is unfolding, so be mindful of this. 


## Disable _all_ audio notifications. No exceptions.

Slack shouldn't ever be able to make noise. If someone uses an `@here` or `@channel`, you shouldn't hear it. Regular messages in channels should _absolutely never make noise_. It's extremely disruptive to your own thinking if someone else can rip your attention away from something just by posting a message like 

> [example]

## Disable all desktop notifications. No exceptions, except for "pager-duty" style "the world is burning down" notifications.

Slack has a "feature" where every message posted to every channel might float a little notification in the top-right corner of your screen. This is as bad as audio notifications of new messages. 

This feature is as bad as audio notifications that you've got a new message. Turn it off. 

## Make your profile useful

- a picture helps
- So does your title, department, location, etc.

I work on a remote team, and in the company of about ~200 people, about 20 of us work remotely. The other 180 work in one of two offices, and have soaked up all the knowledge about who's who, what they do, etc. Us remote folk don't have this knowledge, and it's hard to reach out to someone new when I don't know their position or title. 

Maybe I need help with something related to HR, or trying to refer someone to our recruiting team, or ping someone who filed a bug report - all of this is a bit trickier when I don't know what team someone is on. So please, fill out your profile. 


Use code fencing for long blobs of code, or logs, or whatever:

```
def some_data_structure.reduce("") do |res, item|
  # what do you think I should do in here?
end
```
The above looks so much better than:

def some_data_structure.reduce("") do |res, item|
  \# what do you think I should do in here?
end


<!--more-->

Like these rules? Here's a check-list to rate your slack usage:

- [ ] You have a profile picture in which you are recognizable
- [ ] Your position, title, and/or department are listed
- [ ] When you send someone a message, you try to send a "whole message", rather than rely on rapid, real-time, back-and-forth
- [ ] When replying to someone else's message, you tend to "thread" messages, rather than reply in the channel
- [ ] When referencing a portion of a URL, or directories, or a variable name, or any sort of special computer/programming-related text, you use `pre-formatted text highlighting`
- [ ] When quoting someone, you use Slack's built in "quote" functionality
> here I am, quoting someone
- [ ] You use triple backticks (\`\`\`) around your pre-formatted text When pasting in a long error message, or logs, or a multi-line chunk of code
- [ ] You use Slack's "add snippet" tool if pasting a _really_ long chunk of code or set of logs. 



