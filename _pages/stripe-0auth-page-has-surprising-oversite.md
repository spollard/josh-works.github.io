---
layout: page
title: Dear Stripe, You Have A (Minor) UX Problem
status: published
type: page
published: true
description: ""
permalink: "/stripe-auth-page-has-surpring-oversite"
---

Hi there, Stripe!

**tl;dr There's a minor UX problem on one of your page. It's a spot where I ran into friction. But, Stripe recognizes that much of their business comes from removing friction, not just because that leads to 💰, but because less friction means measurable improvements to the lives of many.**

And that "measurable improvement" can be life and death with someone who has little enough margin in their life.

Quoting from your [remote hub one year] piece:

> ... We now refer to non-card payment options as “local payment methods”. This distinction recognizes and reminds us that while commerce is global, **the experience is local**.

You care about the experience of individuals "at the margin". They are not many, but that does not mean their experience is less important to Stripe. In many ways, I believe, Stripe cares particularly deeply about the experience of those individuals. 

Easy example, quoting Patric Collison's comment [on this Hacker News thread](https://news.ycombinator.com/item?id=22936818)

> (Updated to add: further down in this thread, fillskills writes[1]: "_As someone who saw this first hand, Stripe’s fraud detection really works. Fraudulent transactions went down from ~2% to under 0.5% on hundreds of thousands of transactions per month. And it very likely saved our business at a very critical phase."_ This is what we're aiming for (and up against) with Stripe Radar and Stripe.js, and why we work on these technologies.)

Otimization at the margin matters, and I want to draw your attention to an experience I just had.

This experience just almost cost me setting up an account with Calendly. I was really on the fence about the integration, and I went with the upgrade because I knew I could use Stripe, and I knew that would mean it would be painless. If I had to use any other service, I probably wouldn't have upgraded.

Again, for me, it was a trivial inconvenience. For someone else, it would be much more of a problem. Life and death, maybe, or at least money earned and value delivered. 


----------------------------

I was just trying to hook up my Calendly account to my Stripe account. I'd finally pulled the plug on upgrading my account (in support of business I'm working on!) and of course wanted to route the funds through Stripe. 

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

I was annoyed, and frustrated. It seemed so out of character for the seamless experience I've always had with Stripe. 

# the solution

I'm sure that in 10 minutes of examination, someone at Stripe will envision a very stripe-ish UX fix for this error I made, perhaps offering a modal that says 

> We think you might already have a stripe account. Why don't you try [signing in here]

It would save me a few minutes, and it might help other businesses get more customers, which increases the GDP of the internet. ;)

# Why this post on this page?

I wanted to capture this problem as quickly as possible, knowing that as soon as I moved on, I'd forget this whole UX experience, and probably never run into it again. 

So, I "grabbed a pen" and started writing 

1. in the easiest way I know how, which was telling a story (the above) 
2. to someone who would be able to fix it (someone at Stripe)
3. in a way that made it likely that they'd read it. (I would always read a blog post that had my company name in the URL)

Here we are! 

I don't know what this fix is, it doesn't matter. From my point of view, everything Stripe does, they tend to do well, and with good intent for the user. This oversight seems to be just that - an oversight. 

Hope you can fix it! 

I'm going to just email a link to this page to the support team. 

I don't want to tweet it at Patric Collison and make it look like I'm trying to put Stripe on blast. 

But I also have so much other stuff I need to do, that I don't want to spend even more time figuring out how to get this to Stripe in the right way than I already have!

\- Josh