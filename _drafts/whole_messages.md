---
layout: post
title:  "Whole Messages in Slack"
date:  2018-12-17 06:00:00 -0700
crosspost_to_medium: false
categories: [remote_work]
tags: [remote, tools]
permalink: whole-messages-in-slack
---

A while back, [I learned about "whole values" in Ruby objects]( {{ site.baseurl }}{% link _posts/2018-10-12-primitive_obsession_and_exceptional_values.md %}).

For example, if you call `course.duration`, it might return `6`. 

`6` what? 6 Days? 6 weeks? Avdi talked about making the value "whole", by including every element required to correctly parse the `duration` attribute. `course.duration` would now return something like `Weeks[6]`. Unambiguous. 

I've had an idea for something similar regarding _Slack_ messages rolling around my head. Since I work remotely, most of my communication with my coworkers happens via text. Sometimes this is comments in Jira tickets, but a large amount of it happens in Slack. 


## Three Slack suggestions

These are just _suggestions_, or even _personal preferences_. If you read these and think:

> Eh, not for me.

That's totally fine. If you read them and think:

> This is interesting. I didn't even know anyone noticed such things. It makes no difference to me if I do these things, so I'll lean in the direction of Josh's preference, even if its just to make his life a little easier.

Then my goal wildly accomplished.

### 1. Send whole messages

My preference for a work communication is more-or-less asynchronous. Some times we need to communicate in real time, and I'm happy to hop on a call when helpful.

But lots of messages in Slack don't have to be synchronous. So, here's a few anti-patterns for ways I've seen messages begin:

> Ping

> Hey

> Question for you

I've gotten messages like this from quite a few different people. Eventually, I respond, and anything I say will tend to encourage the actual question.

> them: hey
> me: yes?
> them: I had a question on {a Jira ticket}. Do you know when ... etc etc

My answer doesn't contain any signal. It's just a text equivalent of "please go on". 

Another example:

> them: Hi there. Got a minute for a question?
> me: uh, you've already asked a question. If the answer takes a few seconds, I can answer it right now. If it takes a few minutes/hours, I'll answer it later. I really cannot tell you if I can give an naswer because I have no idea how much time/effort is required. So, please, fire away with the question. 

When I'm composing a message to someone, I try to provide all of the information they need in a single message. I'll often preface it with something like:

> Hey {so and so} - this is not urgent, and I don't want a response until it's convenient for you. 

So, if they see a notification on their phone because they're away from their desk - they can go ahead and ignore the notification. They can follow up at their leisure. 

TODO: Add some examples from Turing/Wombat slack. 

Another example - I got the following from someone I'd never exchanged messages with before, and whose name I did not recognize:

> Hey! I have a few questions for you if you have some time today

I replied with:

> go ahead and ask the question. I'll answer when I can. We're doing a deploy right now, but no harm in asking. (I'm a fan of "whole messages", so you should go ahead and fire off as long of a question as you want, link to tickets, screenshots, whatever, and I'll follow up when I can.)

### 2. Have your job title or a job description in your profile somewhere

Before Wombat was acquired, I had about 230 coworkers. Now I have 2500. It's _desperately_ useful for me to know who works on what team and on what product, if I get a message out of the blue from someone, or if I need to send someone a message. 

Sometimes, in the course of building a feature, I'll hear a message that says

> To get {such and such} configured, message {some person}. 

It's great if, when I compose a message to that person, I can figure out what team/product/role they have. DevOps? Support? Human Resources? Engineering on a different product? These are wildly different teams, all of which would get different kinds of messages. 

Here's what my profile looks like:

![My slack profile at Wombat/Proofpoint]()

As a case study, I got a message recently that I thought was from someone on our support team. This knowledge drove my answer in a certain direction. 

A few minutes later, after looking said person up in our company directory (not finding them) I turned to LinkedIn - turns out this person was a developer on another product. This information obviously shaped my answer in a _different_ direction. 


### 3. Use a profile picture that kinda-sorta has you in it

This is the weakest suggestion I'm making in this post, it's more of a "nice to have". 

I find it helpful when people use a picture of themselves in their profile pictures. 

I hate the idea of "oversharing", and if you don't want to put a picture of yourself in Slack, that's fine, but I'd prefer that more people used profile pictures. 

This makes it a bit easier for me the few times a year I return to the office - I've met people in person that I didn't even realize I've spoken with them _extensively_ via Slack. Pictures help narrow down the pool of people in the "i have no idea who you are" bucket. 

