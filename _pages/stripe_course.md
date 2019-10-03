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

Maybe the idea of vendor lock-in sends you running for the hills. Horror stories of Paypal withholding funds makes you uncomfortable, but you don't like redirecting a customer to a whole second landing page to purchase something.

Or you happen to like Stripe, the company, and see what the deal is with using their tools. 😁

### You value your time

When I launched into this little project, I thought it would take just a few hours. Stripe's documentation is _the gold standard_ for API docs, and [Zapier](https://zapier.com/) and Gmail are super simple. How hard could it be to get everything up and running?

The answer is `longer than I expected`. I think it took me over <strike>8</strike> <strike>15</strike> too many hours to do what would now take me about hours. 

Let my <strike>thirteen</strike> many hours of extra effort save you a few hours of your own. If you're a software developer making $80,000/yr, your effective hourly rate is $40/hr. You may prize your precious non-work hours even more than $40/hr.

This course will save you at least five of your precious non-work hours, so you can get to building/selling the things you want to build and sell, and living your life. 

**If you value your time at at least $6/hr, this course will be money well spent.**

### You want to learn from <strike>my</strike> other people's mistakes

- Did you know that the default HTML/Javascript from Stripe has a formatting error? The button won't work until you fix it. I'll show you the error.
- Did you know that the default button formatting (from Stripe) makes it hard to tell that it's a button? I'll show you how to fix this with a little HTML and CSS. 
- You want to be confident that what you are building will work; testing in Stripe can be tricky, knowing how to set it all up to let yourself to end-to-end testing of the checkout process (and I'll make sure you don't violate Stripe's Terms of Service along the way!)
- How to navigate the test modes across products, customers, purchases, and connections to third-party tools?
- Did you know that Stripe and Zapier don't have any defaults that let you figure out what product a customer is buying? I had to send [this gist](https://gist.github.com/josh-works/970c7f258832c86bd8136bafd5a6789d) to Stripe's support team, to figure out the key pieces of this whole process; that was after a similar email and conversation with Zapier's support team concluded with `¯\_(ツ)_/¯ `. 

I didn't know any of the gotchas and issues that popped up as I made this course. I document them all carefully, for your benefit. You'll save ten hours, maybe more. 


### You'll get (and learn how to build one, if you want) a self-serve one-click "refund me my money" button.

At any point in time, between now and forever, you can get a 100%, no-questions-asked, refund. I'll even make it automatic, so you don't have to ask. You can just click a link and get your money refunded. 

(Of course, I'll teach how to set all this up in the course, as well.)

I have complete confidence in the value of what you're getting; if you decide it's not a good fit, or life circumstances change and you need the cash on hand - no problem. You get a refund, _and you get to keep the course._

When I told some friends about this plan, they thought I was crazy. 

> How can you do self-serve 100% refunds and expect to not get taken advantage of???

If it turns out a large percentage of people who purchase this course abuse that refund option, I'll change it. But that change will be reflected in this promise to refund money. If you've purchased this course while reading this note, you'll get 100% life-time refunds, no questions asked. 

So, what this means is:
- I'll show you how to build automatic refunds into your Stripe course
- As I build this feature into this course

# So what's actually covered in this course?

In this short course, you'll learn how to:
- Get a "buy now" button on your website that people can use to purchase things from you
- Use third-party tools to automatically deliver the purchased item to the customer
- manage all this in the back-end
- test it all thoroughly
- let the customer run a refund if they want

You'll also learn:
- Gotchas with the default HTML/Javascript Stripe gives you
- Basic styling so the "purchase" button will match the look and feel of your site
- Gotchas around test modes and accounts

We'll use a few tools:
- Stripe (duh)
- Zapier
- Gmail or Mailchimp
- Dropbox


# Why shouldn't I just use an existing platform?

I've used Stripe to take payments before, using plugins with [Wordpress](https://wordpress.com/), or [Squarespace](https://www.squarespace.com/), or different tools entirely, like [Gumroad](https://gumroad.com/). All of these tools do more than I want; they lay their pretty UI on top of mine. I want to figure out how to control the experience a bit more, and in doing so, learn a lot.

Granted, these tools are appropriate for a variety of use-cases, like:
1. Non-technical users
2. Anyone who's more interested in selling product than understanding what's happening under the hood
3. Anyone who is comfortable with "vendor lock-in", and is willing to tie their business to Gumroad, or Shopify, or Wordpress, or Squarespace, or whatever. 

Since I'm using Jekyll and Github Pages to serve this website, I wanted to figure out how to be able to take payment with this as well. 

I've bundled all of my learnings into three different packages:

For $0, you'll get a sample of the guide, delivered to your inbox. 

For $30, you'll get the guide in written format. It looks like this:

![course preview](/images/2019-09-20-stripe-01.jpg)

-----------------------

To "kick the tires", as it were, and show that you will learn how to thoroughly test the whole process, end to end, here's a TEST purchase button, hooked up to my TEST Stripe dashboard. 

To test the process, enter `4242 4242 4242 4242` for the credit card number, and an expiration date with any date in the future. Please enter a real email address, as that's how you'll receive the course sample.

<!-- all stripe JS below here -->
<script src="https://js.stripe.com/v3"></script>
<!-- button for course with video -->
<!-- This is my test purchase button. -->
<button
  id="checkout-button-sku_Fo5gnUdda4RhOF"
  class="stripe_button hvr-grow"
  role="link">
  Purchase Course (written guide only) (test) 
</button>
<div id="error-message"></div>

----------------

Of course, there's two product tiers, so we'll have two _free_ product tiers, as well.

Use this button to test the purchase/deliver process with the course that includes a short video walk-through:

<button
  id="checkout-button-sku_FroW7tOGV8c2Me"
  class="stripe_button hvr-grow"
  role="link">
  Purchase Course (with video) (test)
</button>

<div id="error-message"></div>

<!-- script for free course, book + video -->
<script>
(function() {
  var stripe = Stripe('pk_test_j2zjmd474ylQiqIHeMwF2huu00Vv3DnT8Y');

  var checkoutButton = document.getElementById('checkout-button-sku_FroW7tOGV8c2Me');
  checkoutButton.addEventListener('click', function () {
    stripe.redirectToCheckout({
      items: [{sku: 'sku_FroW7tOGV8c2Me', quantity: 1}],
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
})();
</script>

<!-- Button for free course, no video -->
<script>
(function() {
  var stripe = Stripe('pk_test_j2zjmd474ylQiqIHeMwF2huu00Vv3DnT8Y');

  var checkoutButton = document.getElementById('checkout-button-sku_Fo5gnUdda4RhOF');
  checkoutButton.addEventListener('click', function () {
    // When the customer clicks on the button, redirect
    // them to Checkout.
    stripe.redirectToCheckout({
      items: [{sku: 'sku_Fo5gnUdda4RhOF', quantity: 1}],

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
})();
</script>