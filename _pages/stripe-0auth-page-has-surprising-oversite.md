---
layout: page
title: Dear Stripe, You Have A (Minor) UX Problem
status: published
type: page
published: true
description: ""
permalink: "/stripe-auth-page-has-surpring-oversite"
---

Hi there, Patrick!

**tl;dr There's a UX problem on [https://connect.stripe.com/](https://connect.stripe.com/). It's "just" friction. Most businesses wouldn't care, but you and Stripe recognize that much of your business comes from removing friction, not just because that leads to 💰, but because "less friction to send and receive money on the internet" means measurable improvements to the lives of many.**

I wrote most of this post in May. I passed this along to the Stripe support tteam, and didn't get much of a response. (More on that below)

I'd DM'ed you (Patrick) on Twitter, but expected it to be one of 10,000 messages you got that day. 

Today, July 21st, I read [Stripe: Building a Developer Cult](https://subvert.substack.com/p/stripe-building-a-developer-cult) and felt I should try to bring this to your attention again, so you can pass it off to the appropriate team.


## The problem

I was just trying to hook up my Calendly account to my Stripe account. I'd finally pulled the plug on upgrading my account (in support of a business I'm working on!) and wanted to route the funds through Stripe.

I ended up on [this](https://calendly.com/integrations/stripe/) Calendly Page, which this helpfully-labeled button:

![calendly link to Stripe](/images/stripe_ux_00.jpg)

So, I clicked the button, and ended up here:

![connect calendly and stripe](/images/stripe_ux_02.jpg)

I didn't see this `Already have a stripe account? Sign In` button. So I filled out the whole form:

![bad stripe ux](/images/stripe_ux_01.jpg)

This whoooooole form:

![gif of long form](/images/stripe-surprising-oversite-01.gif)

When I hit the submit button, I got an error about one of the fields. I corrected it, hit the submit button again, and _then_ I got a modal that said 

> "I'm sorry, that account already exists. Please go sign in"

😢

## The results of the problem

Of course, I lost some time by having to fill out the form twice. If I'd had a lower degree of trust in Stripe, I would have possibly not filled out the bank details (routing/account number). 

I was annoyed, and frustrated. It seemed so out of character for the seamless experience I've always had with Stripe. 

None of these problems though were the worst of it. I was so confident that for some reason I had to create a _new_ account that I'd spent a few minutes thinking (and dreaming, to be honest) about the company name I would use. 

So, when it turns out all that effort had been wasted, and I should have simply signed in to my existing Stripe account... I felt disappointed, a little dejected, and surprised that I'd had such a poor experience. 

### I don't know the solution, but someone on your team does

I'm sure that with a few minutes of examination, someone at Stripe will envision a very stripe-ish UX fix for this error I made, perhaps offering a modal that pops up if it looks like someone with an existing Stripe account is filling out the form, that says:

> We think you might already have a Stripe account. Why don't you try [signing in here]?

It would save me a few minutes, and it might help other businesses get more customers, which increases the GDP of the internet. 😁

### Why _this_ post on _this_ page?

I wanted to capture this problem as quickly as possible, knowing that as soon as I moved on, I'd forget this whole UX experience, and probably never run into it again.

I think often of this chart:

![write it now](/images/2020-07-21-write-it-now.jpg)
_source: [@sarahdoingthing](https://twitter.com/sarahdoingthing/status/889082755203518464?s=20)_

That peak for `compression speed` arrives and departs very quickly for me. 

So, I "grabbed a pen" and started writing 

1. in the easiest way I know how, which was telling a story (the above) 
2. to someone who would be able to fix it (someone at Stripe)
3. in a way that made it likely that they'd read it. (I would always read a blog post that had my company name and/or my name in the URL)

So here we are! 

I don't know what this fix is, it doesn't matter. From my point of view, everything Stripe does, they tend to do well, and with good intent for the user. This oversight seems to be just that - an oversight. 

### Steps I've taken to get this issue to the right person(s)

Here's the steps I've taken to get this issue to the right person, who both cares and can direct someone to get it fixed:

<strike>I'm going to just email a link to this page to the support team.</strike> 

_2020-07-21 update: Tried this, and got the standard brush-off:_

> Thank you for sharing your feedback and taking the time to write a blog and explained what you've experienced while connecting with us! 
> 
> We're always happy to gather as much feedback as we can regarding our products, user interface and services, and using that as the basis for continual product development in the future. This will ensure that Stripe is as efficient and user friendly as it can be going forward.

I don't fault anyone on the support team at all! They don't necessarily have the power to put this in front of the right person, even _if_ they knew who that person was.

I don't want to tweet it at Patric Collison and make it look like I'm trying to put Stripe on blast. 

_2020-07-21 update: I'll email this to patrick, float it up his inbox a few times_

But I also have so much other stuff I need to do, that I don't want to spend even more time figuring out how to get this to Stripe in the right way than I already have!

\- Josh



### margenalia

I'd included this section earlier, explaining why I was approaching this "bug report" in a seemingly unconventional way.

--------------------

Quoting from Jay Shirley in [Stripe's remote engineering hub, one year in](https://stripe.com/blog/remote-hub-one-year):

> ... We now refer to non-card payment options as “local payment methods”. This distinction recognizes and reminds us that while commerce is global, **the experience is local**.

The words I often hear you say translate to "Stripe cares about the experience of individuals _at the margins_, individuals many other organizations completely ignore."

Easy example, quoting Patric Collison's comment [on this Hacker News thread](https://news.ycombinator.com/item?id=22936818)

> (Updated to add: further down in this thread, fillskills writes[1]: "_As someone who saw this first hand, Stripe’s fraud detection really works. Fraudulent transactions went down from ~2% to under 0.5% on hundreds of thousands of transactions per month. And it very likely saved our business at a very critical phase."_ This is what we're aiming for (and up against) with Stripe Radar and Stripe.js, and why we work on these technologies.)

Otimization at the margin matters, and I want to draw your attention to an experience I just had.

This experience just almost cost me setting up an account with Calendly. I was really on the fence about the integration, and I went with the upgrade because I knew I could use Stripe, and I knew that would mean it would be painless. If I had to use any other service, I probably wouldn't have upgraded.

Again, for me, it was a trivial inconvenience. For someone else, it would be much more of a problem. Life and death, maybe, or at least money earned and value delivered. 

