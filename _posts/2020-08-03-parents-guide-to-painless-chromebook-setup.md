---
layout: post
title: A Runbook for Upgrading Your Parent's Junky Old Laptop to a Chromebook
status: published
date:  2020-07-20 06:00:00 -0700
type: page
published: true
description: "Upgrade your aging parent's clunky laptops to a Chromebook. A guide by an empathetic Mac/Android-using software developer who loves his mother-in-law very much."
permalink: "/upgrade-parents-junky-old-laptop-to-chromebook"
categories: [guides, in-laws]
tags: [chromebook]
image: "/images/2020-08-03-screen-01.JPG"
---

#### tl;dr: I'm creating a `runbook` for a very specific, delicate, and potentially time-consuming and emotionally-charged operation to `replace my 70-year-old newly-widowed mother-in-law's ancient desktop computer with a easy-for-me-to-manage Chromebook`

["shut up and take my money" (aka `jump to pricing`)](#purchase-options)

Wikipedia says a `runbook` is:

> In a computer system or network, a runbook is a compilation of routine procedures and operations that the system administrator or operator carries out. System administrators in IT departments and NOCs use runbooks as a reference.
>
> Runbooks can be in either electronic or in physical book form. Typically, a runbook contains procedures to begin, stop, supervise, and debug the system. It may also describe procedures for handling special requests and contingencies. An effective runbook allows other operators, with prerequisite expertise, to effectively manage and troubleshoot a system. 

- [_source_](https://en.wikipedia.org/wiki/Runbook)


Here's the definition for the runbook _I_ will create:

> In <strike>a computer system or network</strike> `life`, a runbook is a compilation of routine procedures and operations that the <strike>system administrator or operator</strike> `individual` carries out. <strike>System administrators in IT departments and NOCs</strike> `People` use runbooks as a reference.
>
> Runbooks can be in either electronic or in physical book form. Typically, a runbook contains procedures to begin, stop, supervise, and debug the <strike>system</strike> `situation`. It may also describe procedures for handling special requests and contingencies. An effective runbook allows other <strike>operators</strike> `people`, with prerequisite expertise, to effectively manage and troubleshoot a <strike>system</strike> `situation`. 

### How I decided on a "runbook" instead of a "guide"

A day after I announced the first version of this, a friend replied:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I&#39;ve got 90%ish of my laptop set-up in a single bash script. Would probably pay for the chromebook equivalent of that + documentation explaining what has been setup. Something that creates all of the necessary accounts and software and explains it....</p>&mdash; Jack Pincus (@jwpincus) <a href="https://twitter.com/jwpincus/status/1290721824418877441?ref_src=twsrc%5Etfw">August 4, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

He said:

> I've got 90%ish of my laptop set-up in a single bash script. Would probably pay for the chromebook equivalent of that + documentation explaining what has been setup. Something that creates all of the necessary accounts and software and explains it....

I replied with (essentially)

> That's what I'm trying to do

And then I used a word in my response that was a big `aha` moment:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">i don&#39;t think i&#39;ll be able to make it that clean of a process, but I&#39;m thinking more of a Runbook for a given situation.<br><br>- &quot;if this, that&quot;<br>- &quot;this portion is Very Important, the rest of this is not&quot;.<br>- pre-written scripts for common objections<br><br>etc.</p>&mdash; Josh Thompson (@josh_works) <a href="https://twitter.com/josh_works/status/1290767936739672064?ref_src=twsrc%5Etfw">August 4, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

------------------------------------------ 


## Runbook Origin Story, aka 24 hours ago (Aug 3, 2020)

I spent a few hours recently helping my 75-year-old mother-in-law reconnect her junky old Windows laptop to the internet. Across five phone calls, and many pictures of her computer screen, we got her internet working again. 

As I did this, I live-tweeted the experience. It was about 20 tweets. A few pictures my mother-in-law sent me, and a poll.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">My mother in law is frustrated that her internet wasn&#39;t working today. It&#39;s been broken all day. I&#39;ve called her a few times between other events to try to help debug it. <br><br>This is a screenshot I just received (via email) that she took *with her phone* <a href="https://t.co/5KnfCGZ2F4">pic.twitter.com/5KnfCGZ2F4</a></p>&mdash; Josh Thompson (@josh_works) <a href="https://twitter.com/josh_works/status/1290420667444338688?ref_src=twsrc%5Etfw">August 3, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Part of the debugging process involved her taking pictures of her computer screen, because I couldn't tell what she was looking at. (I don't ever use a Windows operating system, so I was operating blind.)

She was frustrated with it all, so I'd first suggested plugging-in/unplugging the router. It would be easier to walk her through that then the unfamiliar OS. 

After it didnt work (and hours passed) we did this back and forth. She took a picture and emailed it to me.

It took a few minutes to arrive, then I'd look at it, tell her what to click, and wait for another screenshot:

![first picture](/images/2020-08-03-screen-01.JPG)

about 15 minutes and another phone call later, I got this:

![second picture](/images/2020-08-03-chromebook-rotated.JPG)

All she ended up needing was to click her home wifi network and connect to it, per these screenshots. 

Months ago, I'd read things like:

- [Secure browsing for elderly: chromebook or Windows 10 S (reddit)](https://www.reddit.com/r/chromeos/comments/h82m1d/secure_browsing_for_elderly_chromebook_or_windows/)
- [A chromebook for elderly people (reddit)](https://www.reddit.com/r/chromeos/comments/cdgq1q/a_chromebook_for_elderly_people/)
- [People who bought a Chromebook for an elderly or tech illiterate parent/relative, what has yours and their experience been so far? (reddit, five years old! 😭)](https://www.reddit.com/r/chromeos/comments/34v0w2/people_who_bought_a_chromebook_for_an_elderly_or/)

On this last one, read through this answer. Emphasis mine. 

> I convinced my wife and her two brothers to purchase the Asus Chromebox for their mother this past December for Christmas.
> 
> **She had been complaining about how slow her desktop had been for years**. Every year we all put money together to update something electronic for her. One year it was a camera, then she lost that camera (lol) so we got her another the next year. Then it was a Bluray player. The computer had been on the list for years.
> 
> **In my family and circle's I am the "go to person" to fix computer or technology related problems. I never gave my self that title but unfortunately for me I'm stuck with it.**
> 
> I don't know about you but I can't count how many times I've been asked to "fix", "speed up", or "I think I might have a virus, my computer is so slow can you take a look at it". **What I have found over the years is that almost always there isn't a virus. The fix for all of those problems more times than not is you need a new machine. Your Sh\*\* is old**. And honestly I just grew tired of getting this from so many "tech illiterate" people.
> 
> **Windows (I can't speak for Mac) is a pain to maintain. There are a lot of people who would say otherwise but unless you find that sort of thing easy, it just is.**
> 
> **So with all that (hopefully funny backstory) said I wanted to get my mother in law a Chrome device. And like I said we got the Asus Chromebox.**
> 
> **Let me tell you, it is by far my mother in laws favorite device we ever got her.** We got it off of Amazon on black Friday. **We paid $119.99** US and I bought an extra stick of ram from corsair I believe. That would upgrade the ram from 2gb to 4gb.
> 
> **She no longer has a slow computer. It boots up in less than 10 seconds. Everything is saved and synced. No windows updates. No fragmented hard drives. No virus/malware. She can still play solitare via a chrome store app. It plays video's great when she sees them while looking at her facebook. The browser doesn't lag and isn't slow. ChomeOS updates automatically and is seamless. I know a lot of people that had their windows machines freeze while on a windows update. Essentially making their computer a brick, until someone like me comes and fixes it for them. If ChromeOS ever gets into trouble, it is as simple as doing a "powerwash" which is basically a factory reset and everything goes back to new. But since everything in ChromeOS is synced, as soon as you log back in everything is restored just how it was.**
> 
> Chromebooks/boxes come with at least 100gb of online storage and Drive is "mounted" in chromeOS it's self so it acts just like if it were a hard drive in the computer. ChromeOS is incredibly simple. There aren't a lot of options menus. You can't get lost in the OS.
> 
> **ChromeOS I would argue is amazing for tech illiterate people**. I'm far from tech illiterate but ChromeOS has been an absolute breath of fresh air for me as well! There really isn't much of a learning curve, outside of understanding how to install/remove a chrome app or extension.
> 
> There are, however, some take-aways. For one you can not install any software like you would on windows or mac. There is one program my mother in law uses and I have found no way of a work around for her and the chromebox. Skype is not available right out of the box for ChromeOS. There is a a work around but requires using a program to convert the Android Version to work in ChromeOS.
> 
> I have lots more I could say, but I'm getting the evil eye from the wife, time to get off of Reddit!
> 
> **I can't recommend a Chromebook/Box more, especially for non tech folks. And is wonderful for us who have to run tech support. Makes our job so much easier! I tell people to first examine their primary needs and research if they can be met with ChromeOS, before buying. Understand it's limitations. If you go into it knowing exactly what you are getting, then it is a wonderful experience.**

I was hooked. I want a Chromebook for my mother-in-law! $120? I would have bought that _yesterday_ if I knew exactly what to do and how long it would take to setup. 

I'd have spent another $120 on a guide that gave me exactly what I needed, super-custom to my exact use-case and background. `:chefs-kiss:`

**I want (and will therefore create) a Runbook to figure out what Chromebook to get her, set it up for her, and help her be successful with it. This can easily take many hours. I want my effort to be helpful to you.**

It won't be quite as straight forward as a bash script - think of it as a `Runbook for Humans`

-------------------


Later that day, here's what happened:

![write it now](/images/2020-07-21-write-it-now.jpg)

_source: [@sarahdoingthing](https://twitter.com/sarahdoingthing/status/889082755203518464?s=20)_

So, I've got a lot of the questions I'll need answered jotted down, and I wanna see if there's any interest in buying a guide like this. Would it be worth $10 to you? $100? $1000? 

In the pole, someone expressed it might be worth as much as $2000, so I am including that option below.

Maybe it's worth $1000 but you don't even have $5 to spend to acquire the guide. Whatever I end up creating, I'll make available to you. 

---------------------

Here's the current planned detail of the guide, as it exists in my head right now:

### Questions I'll answer

- When I recognized it was the right time to actually take action
- How I phrased the pain-points so she would agree that it was a problem
- How I used the time I spent debugging her problems convincing her that she should use a different type of laptop
- what actual machine to buy
- how to set up an account for your parent
- how to handle them using a non-gmail account (I assume this is a requirement)
- how to take remote access of the machine and accomplish tasks yourself. (This beats your mother-in-law emailing you cell phone pictures.)
- her reactions and first-run experience with my documented process
- how I tweak my plans based on her responses
- how to use all of this information to aid your own parents through a similar process

### The benefits you will receive from this guide

- Help your parent(s) feel a sense of dignity and control through this process, even though it might feel like it's displacing an important, familiar thing needlessly
- Remove a point of frustration that might be emotionally charged, thanks to issues related to maintaining competence and control over one's affairs. (I suspect I'll be looking for a `step-by-step guide to helping your aging parents stop driving` soon)
- how to help your parent(s) use as much Gmail as they have to, while most likely using their primary email address with an `AOL` or `yahoo` or `comcast` email account. (and they get tons of spam in it :eyeroll: )
- How to handle a password manager with them. Use or don't use Chrome/Firefox password tools?
- Oh, 1Password? If you use 1Password, and have your parent's credentials in a 1Password vault that is shared with your siblings and/or in-laws, but you're the one who manages that account, what should you do? 
- the above presumes that you came to have your parent's credentials _at their request_, of course.
- once it's set up, can it be easy enough to set up that they can unbox it themselves?
- how much does it cost to ship a laptop through the mail, anyway? Is it safe? Legal?
- Is it _actually_ possible to "easily" "remote in" and "fix things" for your parents? The reader might be skeptical of how "easy and simple" software often is, and is curious to know exactly what to expect.
- An example to point to, when convincing your parent to take the plunge. 

> Look, this guide is from this guy on the internet that did _this exact same thing with his mother-in-law who was similar to you because {reasons}_, and look at this quote here where she says how thankful is she did this thing:
>
>> Hi, I'm Barb, and since I switched to this chromebook thing I spend 20 extra minuts a day facetiming with my grandkids! I love that!

## The un-faq

These are _diqualifying_ conditions. Do not purchase this guide if:

- Your parents are familiar with the Apple ecosystem, because I have always used Android and MacOS, don't have an iPad or an iPhone. I feel strongly inclined to do MacOS.
- You don't want to use a Chromebook or learn a Windows operating system
- You expect a perfectly-polished, high-production-value product

----------------------

The poll got some answers, so I'm tossing up real-live purchase buttons to guage interest at your level of buy-in

## Purchase Options

In the twitter poll, I gave options from $0 to $2000, so giving all those options below. For the record, this is _prepurchasing_ options. I've not built anything yet, other than some notes floating around my laptop. I use "someone put money down" as an expression of strong interest. 

### 1. Money Is No Object ($1900)

You want an excellent runbook and value your time. 

<div class="stripe_button_container">
  <div class="button_container">
    <button
      class="stripe_button"
      style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
      id="checkout-button-sku_Hlof76lIQGPrOW"
      role="link"
      type="button">
      Pre-purchase ($1900)
    </button>

    <div id="error-message"></div>
  </div>
</div>

### 2. Meaningful money, but if it saves you 5-25 hours and hard feelings and frustration, You're All In ($495)

You'd be spending one or two days of income to have a bullet-proof solution to upgrading your aging parent's laptops. The story from Reddit had you nodding along hard. _This is exactly what you experience and want_. But five years ago? What hardware do I need now? Can I dual-boot the operating system? How do I actually convince him/her/them to start using it?


<div class="stripe_button_container">
  <div class="button_container">
    <button
      class="stripe_button"
      style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
      id="checkout-button-sku_HlotwPoptCsYBY"
      role="link"
      type="button">
      Pre-purchase ($495)
    </button>

    <div id="error-message"></div>
  </div>
</div>

### 3. You expect non-trivial value from this guide ($99)

You probably have spent at least $99 on something that will deliver much less value to you than this guide will.

If that's true, but this is not at $495 or $1900 problem to you, this would be your best bet. 

Low cost, you'll get whatever I create. It's a cheap gamble that $99 could save you from "donating" many thousands of dollars over the next six months.

```
20 (scarce, non-work, nights-and-weekend) hours @$100/hr = $2000
```

<div class="stripe_button_container">
  <div class="button_container">
    <button
      class="stripe_button"
      style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
      id="checkout-button-sku_HloZ1DXv53t7fT"
      role="link"
      type="button">
      Pre-purchase ($99)
    </button>

    <div id="error-message"></div>
  </div>
</div>

### 4. What You Might Spend on Dinner with a Friend ($49)

If you think you'd spend $20 but not $50, this guide might not be for you. It will be so good that $50 will be a screaming deal. 

<div class="stripe_button_container">
  <div class="button_container">
    <button
      class="stripe_button"
      style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
      id="checkout-button-sku_Hloz9JPn2QkUAQ"
      role="link"
      type="button">
      Pre-purchase ($49)
    </button>

    <div id="error-message"></div>
  </div>
</div>


### 5. Send You The Guide When I'm Done ($0)

If you just want to follow along, or are on the fence about the value of what I'll make, punch your email in below.

I'll end up writing my process up carefully, and I'll certainly share it out when I'm done. I am good at writing detailed guides that save people dozens of hours and large amounts of frustration. I'll share the guide when I'm done, and I'll send updates as I go. I love to work in public; if you subscribe and follow along, you'll get to see what I'm building as I go, and I'd love to get your input along the way. 

And if down the road you decide it's worth paying for, you'll have the option.

Enter your email, and you'll get all that when it's available:

<script async data-uid="79563b40c7" src="https://josh-thompson.ck.page/79563b40c7/index.js"></script>

_if you don't see the subscribe form above, [click here](https://josh-thompson.ck.page/79563b40c7)._


---------------------------------------

## FAQ

If your question isn't asked, shoot me a note at [@josh_works](https://twitter.com/josh_works) or `joshthompson@hey.com`. I'll answer it and update this list.

### What all is included

A runbook for technical people who help their non-technical aging parents/family/friends with their technology problems. 

Specifically, writing up how to help the following persona:

- A 70 mother-in-law with good relationships with her kids/grandkids
- extremely resistant to change
- feels bad needing constant help from her family
- the tech trouble reminds her that her husband died recently and she misses him
- on good terms with the person using this runbook (you!)

This runbook will rely on building/deepening trust between you and the recipient, and that requires having something to build on. I'm sure it'll be helpful even if the relationship is poor, but I wanted to mention it.

A detailed guide with links to the exact product, tools, services that I use

Lots of perspecive of how this is landing with my mother-in-law

etc.

Might do video walk-throughs. [Here's an example of how I do these](https://josh.works/mythical-creature-refactor-ogre).

### What if you want your money back

Then I 100% wanna give it to you. Just let me know and I'll send it right back, all fees included, between now and forever. 

### You might want the $100, or $500, or $2000 verison, but don't know which/if-any yet

Yeah, totally get it. I'd say pop your email address into the $0 form, and reply to one of the emails when you feel so inclined. 

### You have other questions I'd like to ask you

Great! Pop your email in below; the very first email you'll get asks:

> I'd really love to know what prompted your interest. Are you going through something similar right now? Do you think you might be doing something like this soon? Any advice or words of caution that you'd share?

<script async data-uid="79563b40c7" src="https://josh-thompson.ck.page/79563b40c7/index.js"></script>

_if you cannot see the email collection form above, you will have to turn off your JavaScript blocker or [visit this page](https://josh-thompson.ck.page/79563b40c7) to submit an email address_

_feel free to reach out at `joshthompson@hey.com` if you've got questions_

{% include chromebook-guide-js.html %}