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

Do you use a static site generator like Jekyll, or Hugo, or Hexo, or Gasby? 

Do you ever want to sell some small digital product, that could be delivered via email, through that static site, but without using a service that charges a monthly fee? 

Does the same drive that makes you use a static site generator make you leery of using a third-party tool like Gumroad or Woocommerce? 

If so - read on. 

### You're running a static site because you don't like "magic" or overly-complex tools

I like Jekyll because it's fast and lightweight. Pingdom says this very page you're reading is [about 380Kb and loads in 470ms](https://tools.pingdom.com/#5b53cbf885c00000). That's pretty light and pretty quick. 

I didn't want to jump to a database-backed platform just to sell some some simple digital products. 

### You want to be able to take payments on your site for simple info products

You don't want to re-invent the wheel and jump into a Gumroad-like situation, just to distribute some files after someone pays you some money. 

Maybe the idea of vendor lock-in sends you running for the hills. Horror stories of Paypal withholding funds makes you uncomfortable, but you don't like redirecting a customer to a whole second landing page to purchase something.

Or you happen to like Stripe, the company, and want to see what the deal is with using their tools. 😁

### You value your time

When I started this little project, I thought it would take just a few hours. Stripe's documentation is _the gold standard_ for API docs, and Zapier and Gmail are super simple. How hard could it be to get everything up and running?

The answer is `longer than I expected`. I think it took me over <strike>8</strike> <strike>15</strike> too many hours to do what would now take me about... two hours. 

Let my <strike>thirteen</strike> many hours of extra effort save you a few hours of your own. If you're a software developer making $80,000/yr, your effective hourly rate is $40/hr. You may prize your precious non-work hours even more than $40/hr.

This course will save you at least five of your precious non-work hours, so you can get to building/selling the things you want to build and sell, and living your life. 

**If you value your time at at least $6/hr, this course will be money well spent.**

### You want to learn from my mistakes and struggles

- Did you know that the default HTML/Javascript from Stripe has a formatting error? The button won't work until you fix it. I'll show you the error.
- Did you know that the default button formatting (from Stripe) makes it hard to tell that it's a button? I'll show you how to fix this with a little HTML and CSS. 
- You want to be confident that what you are building will work; testing in Stripe can be tricky, knowing how to set it all up to let yourself to end-to-end testing of the checkout process (and I'll make sure you don't violate Stripe's Terms of Service along the way!)
- How to navigate the test modes across products, customers, purchases, and connections to third-party tools?
- Did you know that Stripe and Zapier don't have any defaults that let you figure out what product a customer is buying? I had to send [this gist](https://gist.github.com/josh-works/970c7f258832c86bd8136bafd5a6789d) to Stripe's support team, to figure out the key pieces of this whole process; that was after a similar email and conversation with Zapier's support team concluded with `¯\_(ツ)_/¯ `. 

I didn't know any of the gotchas and issues that popped up as I made this course. I document them all carefully, for your benefit. You'll save ten hours and whatever monthly fees Gumroad or another provider will charge you. 


### Of course, 100% of your money back, between now and forever. 

At any point in time, between now and forever, you can get a 100%, no-questions-asked, refund.

I have complete confidence in the value of what you're getting; if you decide it's not a good fit, or life circumstances change and you need the cash on hand - no problem. 

Send me an email, and you get a refund, no questions asked. Oh, and you get to keep the course.

# So what's actually covered in this course?

In this short course, you'll learn how to:
- Add a Stripe `purchase` button (or several buttons) on your website that people can use to purchase digital products from you
- Use Zapier and Gmail to automatically deliver the purchased item to the customer
- manage all this in the back-end
- test it all thoroughly

You'll also learn:
- Gotchas with the default HTML/JavaScript Stripe gives you
- Basic styling so the "purchase" button will match the look and feel of your site
- Gotchas around test modes and accounts
- Gotchas when linking Stripe and Zapier together. (This is where I lost _many_ hours)

We'll use a few tools:
- Stripe (duh)
- Zapier
- Gmail
- Dropbox

Even if you don't want to use the exact same "stack" I use, this information will smooth the way to iterate and modify as you see fit; you'll sail past the gotchas, and spend your time on whatever it is you want to give to the world. 


# Why shouldn't I just use an existing platform?

I've used Stripe to take payments before, using plugins with Wordpress and Squarespace, or self-hosted tools like Gumroad. All of these tools do more than I want:

- they make me adhere to their design decisions
- they have _way_ more features and options than what I want
- they have a monthly minimum fee
- they are _great_ tools, but they're a walled garden. (This is why I don't use Medium). 
- they are "heavy" solutions - lots of Javascript, backed by big databases, etc - the opposite of why I run this website on Jekyll + Github Pages

Granted, these tools are appropriate for a variety of use-cases, like:
1. Non-technical users
2. Anyone who's more interested in selling product than understanding what's happening under the hood
3. Anyone who is comfortable with "vendor lock-in", and is willing to tie their business to Gumroad, or Shopify, or Wordpress, or Squarespace, or whatever. 
4. Someone who needs a bit more features than just a "pay me money, I give you product" solution.

-------------------------------------

The solutions out there are _really good_; I'm not trying to convince you to sell your products via Stripe, Zapier, Gmail, and Dropbox - I'm just saying that if you _want_ to sell products via this tools, it's hard to figure out, and this course will get you moving. 

I'd _strongly_ recommend you use the "demo" purchase button below to kick the tires on this whole process, to determine if the way I'm selling this product would work for you. If it does - great! Buy the course. If not, great! Don't buy the course. 

-----------------------------------------

I've bundled this course into four different packages:

- $0: you'll get a sample of the guide
- $0: you'll get a sample of the guide and a video walkthrough
- $25: you'll get the full guide
- $40: You'll get the full guide + all of the video walk-throughs

Again - please try one of the free samples to see if you like what you're going to get. 

I mix annotated screenshots, gifs, code snippets, and more to make a clear walk-through of _exactly_ what I'm doing. It'll be effortless for you to follow. 

Here's what it looks like:

![course preview](/images/course_preview.gif)

-----------------------

To "kick the tires", as it were, and show that you will learn how to thoroughly test the whole process, end to end, here's a TEST purchase button, hooked up to my TEST Stripe dashboard. 

To test the process, enter `4242 4242 4242 4242` for the credit card number, and an expiration date with any date in the future. Please enter a real email address, as that's how you'll receive the course sample.

<!-- all stripe JS below here -->
<script src="https://js.stripe.com/v3"></script>
<!-- button for course with video -->
<!-- This is my test purchase button. -->
<button
  id="checkout-button-sku_Fo5gnUdda4RhOF"
  class="stripe_button"
  role="link">
  Purchase Course (written guide only) (test) 
</button>
<div id="error-message"></div>

_use `4242 4242 4242 4242` as the CC number; enter a valid expiration date_

----------------

Of course, there's two product tiers, so we'll have two _free_ product tiers, as well.

Use this button to test the purchase/deliver process with the course that includes a short video walk-through:

<button
  id="checkout-button-sku_FroW7tOGV8c2Me"
  class="stripe_button"
  role="link">
  Purchase Course (with video) (test)
</button>
<div id="error-message"></div>

_use `4242 4242 4242 4242` as the CC number; enter a valid expiration date_

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
})();
</script>