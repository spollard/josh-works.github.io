---
layout: page
title: How to add Stripe payments to a static site
status: published
type: page
published: true
description: "How to add Stripe to a static site, by Josh Thompson"
permalink: /add-stripe-to-static-site-course
---

### You're running a static site because you don't like "magic" or overly-complex tools

I use Jekyll; maybe you use Jekyll, or Gatsby, or Hugo, or whatever. 

I like Jekyll because it's fast and lightweight. Pingdom says this very page you're reading is [about 380Kb and loads in 470ms](https://tools.pingdom.com/#5b53cbf885c00000). That's pretty light and pretty quick. 

### You want to be able to take payments on your site for simple info products

You don't want to re-invent the wheel and jump into a Gumroad-like situation, just to distribute some files after someone pays you some money. 



In this short course, you'll learn how to quickly take payment on a website with Stripe.

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


