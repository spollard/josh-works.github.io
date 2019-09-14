---
layout: page
title: How to add Stripe payments to a static site
status: published
type: page
published: true
description: "How to add Stripe to a static site, by Josh Thompson"
permalink: /add-stripe-to-static-site-course
---

<!-- Load Stripe.js on your website. -->
<script src="https://js.stripe.com/v3"></script>


### How to Take Payment On A Static Site with Stripe

In this short course, learn how to quickly take payment on a website with Stripe.

This website, the one website you're reading right now is built with a static site generator. It certainly doesn't seem like a second-class citizen in the world of the web. 

Static sites are easy to build, and lightning-fast. That said, they're not backed by any sort of database or content management system (CMS). 

I've used Stripe to take payments before, using plugins with [Wordpress](https://wordpress.com/), or [Squarespace](https://www.squarespace.com/), or different tools entirely, like [Gumroad](https://gumroad.com/). 

Since I'm using Jekyll and Github Pages to serve this website, I wanted to figure out how to be able to take payment with this as well. 

I've bundled all of my learnings into this course.

For $20, you'll get the guide in written format. It looks like this:

![course preview](https://cl.ly/8cad5414cb7a/2019-09-14%20at%201.33%20PM.jpg)


<!-- Create a button that your customers click to complete their purchase. Customize the styling to suit your branding. -->
<button
  style="background-color:#6772E5;color:#FFF;padding:8px 12px;border:0;border-radius:4px;font-size:1em"
  id="checkout-button-sku_FluboPRKa9hMRB"
  role="link">
  Purchase the guide ($20)
</button>

<div id="error-message"></div>




<script>
  var stripe = Stripe('pk_live_NxPjctp5fvGzF77VGC6Ey5oj');

  var checkoutButton = document.getElementById('checkout-button-sku_FluboPRKa9hMRB');
  checkoutButton.addEventListener('click', function () {
    // When the customer clicks on the button, redirect
    // them to Checkout.
    stripe.redirectToCheckout({
      items: [{sku: 'sku_FluboPRKa9hMRB', quantity: 1}],

      // Do not rely on the redirect to the successUrl for fulfilling
      // purchases, customers may not always reach the success_url after
      // a successful payment.
      // Instead use one of the strategies described in
      // https://stripe.com/docs/payments/checkout/fulfillment
      successUrl: window.location.protocol + '//josh.works/success',
      cancelUrl: window.location.protocol + '//josh.works/canceled',
    })
    .then(function (result) {
      if (result.error) {
        // If `redirectToCheckout` fails due to a browser or network
        // error, display the localized error message to your customer.
        var displayError = document.getElementById('error-message');
        displayError.textContent = result.error.message;
      }
    });
  });
</script>
