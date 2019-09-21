---
layout: page
title: How to add Stripe payments to a static site
status: published
type: page
published: true
description: "How to add Stripe to a static site, by Josh Thompson"
permalink: /add-stripe-to-static-site-course
image: "/images/2019-09-20-stripe-01.jpg"
---

### You're running a static site because you don't like "magic" or overly-complex tools

I like Jekyll because it's fast and lightweight. Pingdom says this very page you're reading is [about 380Kb and loads in 470ms](https://tools.pingdom.com/#5b53cbf885c00000). That's pretty light and pretty quick.  Maybe you use Jekyll, or Gatsby, or Hugo, or whatever. 

I don't think I need to jump to a database-backed platform just to sell some some simple digital products. 

### You want to be able to take payments on your site for simple info products

You don't want to re-invent the wheel and jump into a Gumroad-like situation, just to distribute some files after someone pays you some money. 

Maybe the idea of vendor lock-in sends you running for the hills. 

### You value your time

When I launched into this little project, I thought it would take just a few hours. Stripe's documentation is _the gold standard_, and Zapier and Gmail are super simple. How hard could it be to get everything up and running?

The answer is `longer than I expected`. I think it took me over fifteen hours to do what would now take me two hours. 

Let my thirteen hours of extra effort save you a few hours of your own. If you're a software developer making $80,000/yr, your being paid about $40/hr. 

This course will save you at least five of your precious non-work hours, so you can get to building/selling the things you want to build and sell. If you value your time at at least $6/hr, this course will be a great investment. 

### You appreciate low-risk opportunities

At any point in time, between now and forever, you can get a 100%, no-questions-asked, refund. I'll even make it automatic, so you don't have to ask. You can just click a link and get your money refunded. 

(Of course, I'll teach how to set all this up in the course, as well.)

I have complete confidence in the value of what you're getting; if you decide it's not a good fit, or life circumstances change and you need the cash on hand - no problem. You get a refund, _and you get to keep the course._

When I told some friends about this plan, they thought I was crazy. 

> How can you do self-serve 100% refunds and expect to not get taken advantage of???

If it turns out a large percentage of people who purchase this course abuse that refund option, I'll change it. But that change will be reflected in this promise to refund money. If you've purchased this course while reading this note, you'll get 100% life-time refunds, no questions asked. 

# So what's actually covered in this course?

In this short course, you'll learn how to configure, end-to-end, a way to take payment for a digital product, and how to deliver that product to the purchaser. 

This will all happen automatically, so you won't have to do anything 

# Seems pretty selfish, Josh.

Someone could say:

> This sounds like multi-level marketing, Josh. You'll sell a course that teaches people how to take money on a website, so they can then... sell a course about how to take money on a website? That sounds scammy. 

Not qute. Taking payment and distriputing the material means anyone reading this could choose to distribute _any_ course, and get paid for it. 

This website is built with a static site generator. 

Static sites are easy to build, and lightning-fast. This page you're viewing 

That said, they're not backed by any sort of database or content management system (CMS). 

I've used Stripe to take payments before, using plugins with [Wordpress](https://wordpress.com/), or [Squarespace](https://www.squarespace.com/), or different tools entirely, like [Gumroad](https://gumroad.com/). All of these tools do more than I want; they lay a pretty UI on top of what's happening under the hood.

Granted, these tools are appropriate for a variety of use-cases, like:
1. Non-technical users
2. Anyone who's more interested in selling product than understanding what's happening under the hood
3. Anyone who is comfortable with "vendor lock-in", and is willing to tie their business to Gumroad, or Shopify, or Wordpress, or Squarespace, or whatever. 

Since I'm using Jekyll and Github Pages to serve this website, I wanted to figure out how to be able to take payment with this as well. 

I've bundled all of my learnings into this course.

For $20, you'll get the guide in written format. It looks like this:

![course preview](/images/2019-09-20-stripe-01.jpg)

<!-- Load Stripe.js on your website. -->
<script src="https://js.stripe.com/v3"></script>

<!-- Create a button that your customers click to complete their purchase. Customize the styling to suit your branding. -->
<button
  style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
  id="checkout-button-sku_Fo5gnUdda4RhOF"
  role="link">
  Purchase Course ($20)
</button>

<div id="error-message"></div>

<script>
  var stripe = Stripe('pk_test_xTwpkoUrsCpAxKwm69tBZEAe');

  var checkoutButton = document.getElementById('checkout-button-sku_Fo5gnUdda4RhOF');
  checkoutButton.addEventListener('click', function () {
    stripe.redirectToCheckout({
      items: [{sku: 'sku_Fo5gnUdda4RhOF', quantity: 1}],
      successUrl: window.location.protocol + '//josh.works/success',
      cancelUrl: window.location.protocol + '//josh.works/canceled',
    })
    .then(function (result) {
      if (result.error) {
        var displayError = document.getElementById('error-message');
        displayError.textContent = result.error.message;
      }
    });
  });
</script>


