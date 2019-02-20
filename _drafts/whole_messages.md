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

## Slack suggestions

These are just _suggestions_, or even _personal preferences_. If you read these and think:

> Eh, not for me.

That's totally fine. If you read them and think:

> This is interesting. I didn't even know anyone noticed such things. It makes no difference to me if I do these things, so I'll lean in the direction of Josh's preference, even if its just to make his life a little easier.

Then my goal wildly accomplished.

### 1. Send whole messages

My preference for a work communication is more-or-less asynchronous. Some times we need to communicate in real time, and I'm happy to hop on a call when helpful.

Lots of messages in Slack don't have to be synchronous. 

**When you send a message in Slack, it should contain everything the recipient needs to take action.**

Here's some examples.

them. (this was the first time I've "spoken" with this person): 
> Hi there. Got a minute for a question? 

me, about 40 minutes later: 
> can you provide more context?

they provided a _tiny_ bit more context, and I replied with: 

> go ahead and ask the question. I'll answer when I can. We're doing a deploy right now, but no harm in asking. (I'm a fan of "whole messages", so you should go ahead and fire off as long of a question as you want, link to tickets, screenshots, whatever, and I'll follow up when I can.)

When I'm composing a message to someone, I try to provide all of the information they need in a single message. I'll often preface it with something like:

> Hey {so and so} - this is not urgent, and I don't want a response until it's convenient for you. To that end, I'll provide further context and my specific question.

So, if they see a notification on their phone because they're away from their desk - they can go ahead and ignore the notification. They can follow up at their leisure. 

Here's a message (part of a longer note) I sent:

> Also - I am a _massive_ fan of asynchronous, independent work, so anytime you happen to get slack messages from me, please _don't_ feel any pressure to reply. I try to send "whole messages", that don't require much real-time back-and-forth, and don't have any expectations of quick replies.



### 2. Have your job title or a job description in your profile somewhere

Before Wombat was acquired, I had about 230 coworkers. Now I have 2500. It's _desperately_ useful for me to know who works on what team and on what product, if I get a message out of the blue from someone, or if I need to send someone a message. 

My profile has a picture of me, a description of what I do, and a bit more.

As a case study of how time consuming it is when this information is missing - I got a message recently that I thought was from someone on our support team. This knowledge drove my answer in a certain direction. 

A few minutes later, after looking said person up in our company directory (not finding them) I turned to LinkedIn - turns out this person was a developer on another product. This information obviously shaped my answer in a _different_ direction. 




