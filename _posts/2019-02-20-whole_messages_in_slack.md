---
layout: post
title:  "Whole Messages in Slack"
date:  2019-02-20 06:00:00 -0700
crosspost_to_medium: true
categories: [remote_work]
tags: [remote_work, tools]
permalink: whole-messages-in-slack
---

I use [Slack](https://slack.com/features) at work. And used it in Turing. And am in a few programming-related Slack groups. (Ahoy, [#DenverDevs](https://denverdevs.org/)). My last job, I used Slack. The job before that, I got the whole company _on_ Slack. I've used it for years. 

Slack delivers value to me, and induces little anxiety, and most importantly, _Slack does not interrupt my day, and I don't think I interrupt other people's days via Slack much either._

Slack is famous for ruining other people's work-days. Their complaints are valid:

- [Why I'm Breaking Up With Slack (Quartz)](https://qz.com/632016/why-im-breaking-up-with-slack/)
- [How to Use Slack and Not Go Crazy](https://pspdfkit.com/blog/2018/how-to-use-slack-and-not-go-crazy/)
- [Why We’re Betting Against Real-Time Team Messaging Apps Like Slack (Doist)](https://doist.com/blog/asynchronous-communication-betting-against-slack/)
- [Is Group Chat Making You Sweat? (Basecamp)](https://m.signalvnoise.com/is-group-chat-making-you-sweat/)
- [Slack Is Not Where 'Deep Work' Happens](https://blog.nuclino.com/slack-is-not-where-deep-work-happens)

So, if some people like Slack, and some people hate it, what might account for the difference? 

Personal preference is certainly part of the difference... but I think it's not the whole story.

This is a bit of a "how Josh uses Slack" post. It might pair well with PSPDFKit's [How to Use Slack and Not Go Crazy ](https://pspdfkit.com/blog/2018/how-to-use-slack-and-not-go-crazy/).

## Slack settings (aka "Silence the Beast")

Slack's default notification settings will _ruin you_. 

It tries to make sound _and_ pop up a desktop notification _every time someone says something in a channel you've joined_. This is unacceptible. 

Turn off all audible notifications, and while you're at it, turn off the rest, too:

![No notifications!](/images/2019-04-12 at 5.38 AM.png)

![no audible notifications!](/images/2019-04-12 at 5.40 AM.png)

I have sometimes been in the same room as people who have audible notifications when someone posts _anything_ to _any channel_, and feel vaguely horrified. Don't be this person.

When I'm at my computer, I know that I'll see Slack regularly. It's rare that I would go without checking slack for more than 30 minutes. [Deep Work: Rules for Focused Success in a Distracted World](https://www.goodreads.com/book/show/25744928-deep-work) would probably prefer me to go an hour or two without looking at Slack during the day. I hope to get there some day, but am not there yet. 

Since I check Slack regularly when I'm at my computer, I turn off all notifications. If someone sends me an urgent message, they might wait for a while before I write back.

This is OK to me, as I treat direct messages as asynchronous communication, and encourage others to do the same. "You there?" isn't a message I'll ever send.

There are a few channels where an `@here` or `@channel` will cause a notification "dot" to show up on Slack. The vast majority of the rest of the channels I'm in, I've muted even `@here` and `@channel`. 

This means I can be in many channels, and never even know there's conversation happening in them until I choose to go look in them.

![mute all the things](/images/2019-04-12 at 5.53 AM.png)

## "Are you there?" and other messages to never send

A while back, [I learned about "whole values" in Ruby objects]( {{ site.baseurl }}{% link _posts/2018-10-12-primitive_obsession_and_exceptional_values.md %}).

For example, if you call `course.duration`, it might return `6`. 

`6` what? 6 Days? 6 weeks? Avdi talked about making the value "whole", by including every element required to correctly parse the `duration` attribute. `course.duration` would now return something like `Weeks[6]`, or `Months[3]`. Unambiguous. 
<!--more-->

I propose being biased towards sending "whole messages" in Slack, as well. The message should contain every element required to respond correctly.

This makes Slack minimally disruptive to the person receiving the messages, as they can respond at their leisure. (If you're asking a large and complex question in Slack, and you cannot fit it into a single message, consider sending an email!)


These are just _suggestions_, or even _personal preferences_. If you read these and think:

> Eh, not for me.

That's totally fine. If you read them and think:

> This is interesting. I didn't even know anyone noticed such things. It makes no difference to me if I do these things, so I'll lean in the direction of Josh's preference, even if its just to make his life a little easier.

Then my goal is wildly accomplished.

### Send whole messages

My preference for a work communication is more-or-less asynchronous. Sometimes we need to communicate in real time, and I'm happy to hop on a call when helpful.

Lots of messages in Slack don't have to be synchronous. 

**When you send a message in Slack, it should contain everything the recipient needs to take action.**

Here's some examples.

them (this was the first time I've "spoken" with this person): 
> Hi there. Got a minute for a question? 

me, about 40 minutes later: 
> can you provide more context?

they provided a _tiny_ bit more context, and I replied with: 
> go ahead and ask the question. I'll answer when I can. We're doing a deploy right now, but no harm in asking. (I'm a fan of "whole messages", so you should go ahead and fire off as long of a question as you want, link to tickets, screenshots, whatever, and I'll follow up when I can.)

When I'm composing a message to someone, I try to provide all of the information they need in a single message. I'll often preface it with something like:

> Hey {so and so} - this is not urgent, and I don't want a response until it's convenient for you. To that end, I'll provide further context and my specific question.

So, if they see a notification on their phone because they're away from their desk - they can go ahead and ignore the notification. They can follow up at their leisure. 

Here's a message (part of a longer note) I sent to someone I was working on a project with:

> Also - I am a _massive_ fan of asynchronous, independent work, so anytime you happen to get slack messages from me, please _don't_ feel any pressure to reply. I try to send "whole messages", that don't require much real-time back-and-forth, and don't have any expectations of quick replies.

### Miscellaneous other preferences

These are some other "rules" and patterns I've arrived at when it comes to using Slack:

#### Be biased towards using channels for _topics_, and not just _groups of people_

The only channel I try to stay 100% up-to-date-with is my team channel. It's nice having topical channels, as it's easy to know where to go to have conversation on a given topic, rather than topical conversations bleeding into general channels. 

#### Be biased towards using public channels, so relevant parties can join/leave them as needed

A private channel makes you feel a bit locked into it. If you leave it, and need to add something to _that_ channel, you need to be re-invited. So, we all have healthy [fomo](https://www.urbandictionary.com/define.php?term=Fomo) and choose to never leave the channel. This cuts against the general pattern of Slack, and makes it just a smidge more intrusive in the day-to-day. 

> But I don't want the whole company reading what I'm saying in a given channel, Josh!

That's fine. There are certainly times that you might not need the whole company up in your business. But these are few and far between, and _how often do_ YOU _go prowling in other team's channels?_. My guess is "not that often". 


#### Fill out your Slack profile

Before Wombat was acquired, I had about 230 coworkers. Now I have 2500. It's _desperately_ useful for me to know who works on what team and on what product, if I get a message out of the blue from someone, or if I need to send someone a message. 

My profile has:
1. A picture of me
2. A description of what I do/what team I work with

As a case study of how time consuming it is when this information is missing - I got a message recently that I thought was from someone on our support team. This knowledge drove my answer in a certain direction. 

A few minutes later, after looking said person up in our company directory (not finding them) I turned to LinkedIn - turns out this person was a developer on another product. This information obviously shaped my answer in a _different_ direction. 

#### Close Slack now and again

If I really want to go heads-down on something, and am feeling tons of friction and distraction, I can just enter "monk mode". I'll quit Slack, block every website except what's defined in a whitelisted, pre-determined list (Github, Jira, StackOverflow, language documentation, etc) and will "lock myself in" to a problem for an hour or so. 

I recommend everyone give this a shot now and again. It's nerve-wracking at first, which underscores how valuable it is to actually quit Slack. 


### Resources

- [Why I'm Breaking Up With Slack (Quartz)](https://qz.com/632016/why-im-breaking-up-with-slack/)
- [How to Use Slack and Not Go Crazy](https://pspdfkit.com/blog/2018/how-to-use-slack-and-not-go-crazy/)
- [Why We’re Betting Against Real-Time Team Messaging Apps Like Slack (Doist)](https://doist.com/blog/asynchronous-communication-betting-against-slack/)
- [Is Group Chat Making You Sweat? (Basecamp)](https://m.signalvnoise.com/is-group-chat-making-you-sweat/)
- [Slack Is Not Where 'Deep Work' Happens
deep-work](https://blog.nuclino.com/slack-is-not-where-deep-work-happens)
- [Deep Work: Rules for Focused Success in a Distracted World (Cal Newport)](https://www.goodreads.com/book/show/25744928-deep-work)
- [Please Don't Say Just Hello In Chat](http://www.nohello.com/)
