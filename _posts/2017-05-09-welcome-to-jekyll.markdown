---
layout: post
title:  "Welcome to Jekyll!"
date:   2017-05-09 06:18:52 -0600
categories: jekyll update
---
---
layout: post
title:  "Cleaner Controllers"
date:   2017-05-09 06:18:52 -0600
categories: programming refactoring
---
# On cleaner controllers

A few days ago, I worked on a project that was mostly about serving up basic store data (modeled after Etsy) to an API.

We had a few dozen end-points, and all responses were in JSON.

Most of the action happened inside of our controllers, and as you might imagine, our `routes.rb` file was bananas.

One of the instructors made an exceptionally simple suggestion, I was embarrassed to not have seen it.

It was about nesting our controllers a bit better.

For context, here's our routes for our merchants objects, relationships, and analytics:

{% highlight ruby %}
Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants/merchants" do
        get "items", to: "merchants/merchant_items#index"
        get "invoices", to: "merchants/merchant_invoices#index"
        get "customers_with_pending_invoices", to: "merchants/merchant_pending_customers#index"
        get "favorite_customer", to: "merchants/merchant_favorite_customer#show"
        get "revenue", to: "merchants/merchant_revenue#show"
        collection do
          get "most_items", to: "merchants/merchants_most_items#index"
          get "most_revenue", to: "merchants/merchants_most_revenue#index"
          get "revenue", to: "merchants/merchants_revenue#show"
          get "find", to: "merchants/merchants_find#show"
          get "find_all", to: "merchants/merchants_find#index"
          get "random", to: "merchants/merchants_random#show"
        end
      .
    .
  .
{% endhighlight %}

Look at all the references to `merchant` and `merchants`! Lets count: Twenty-Four uses of the word! Dang! And this is in JUST the endpoints related to merchants! This same replication exists in our items, customers, invoices, and more.

It's also clunky to read. Every single merchants controller in the collection starts the same. That lowers the ratio of signal to noise, as a developer. No good.

Hopefully someone moving through Turing behind us will take this chance for a really easy fix.

And what is the fix?

Here's the file structure of all of our merchants controllers:

```
├── api
│   └── v1
│       ├── merchants
│       │   ├── merchant_favorite_customer_controller.rb
│       │   ├── merchant_invoices_controller.rb
│       │   ├── merchant_items_controller.rb
│       │   ├── merchant_pending_customers_controller.rb
│       │   ├── merchant_revenue_controller.rb
│       │   ├── merchants_controller.rb
│       │   ├── merchants_find_controller.rb
│       │   ├── merchants_most_items_controller.rb
│       │   ├── merchants_most_revenue_controller.rb
│       │   ├── merchants_random_controller.rb
│       │   └── merchants_revenue_controller.rb
│       └── .
├── application_controller.rb
└── concerns
```

Here's a quick mockup of what it _should_ be:
```
├── api
│   └── v1
│       ├── merchants
│       │   ├── favorite_customer_controller.rb
│       │   ├── invoices_controller.rb
│       │   ├── items_controller.rb
│       │   ├── pending_customers_controller.rb
│       │   ├── revenue_controller.rb
│       │   ├── find_controller.rb
│       │   ├── most_items_controller.rb
│       │   ├── most_revenue_controller.rb
│       │   ├── random_controller.rb
│       │   └── revenue_controller.rb
│       └── merchants_controller.rb
├── application_controller.rb
└── concerns
```
I moved the `merchants_controller` _up_ one level, to be outside of the merchants folder, and then everywhere else, I can infer that if a controller is in `merchants/`, it is related to the merchants class. (Rocket science!)

Lets see what this does to our routes from above:

{% highlight ruby %}
Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants" do
        get "items", to: "merchants/items#index"
        get "invoices", to: "merchants/invoices#index"
        get "customers_with_pending_invoices", to: "merchants/pending_customers#index"
        get "favorite_customer", to: "merchants/favorite_customer#show"
        get "revenue", to: "merchants/revenue#show"
        collection do
          get "most_items", to: "merchants/most_items#index"
          get "most_revenue", to: "merchants/most_revenue#index"
          get "revenue", to: "merchants/revenue#show"
          get "find", to: "merchants/find#show"
          get "find_all", to: "merchants/find#index"
          get "random", to: "merchants/random#show"
        end
      .
    .
  .
{% endhighlight %}
That looks a lot better. Half the number of references to `merchants` in the routes. Now... this requires renaming all the controllers, etc, so lets make that happen and see if our tests still pass.

We'll have to update a few files for each of these changes:

- `routes.rb`
- the associated controller (fixing the class name of the controller)
- The associated view, since the expected path is determined by the controller class name.

So, swap everything around, and all the tests still pass, and our routes are way more readable:

![tests pass](https://cl.ly/2w2R2D0s2s15/1__joshthompson_Joshs-MBP-55____turing_3mod_projects_rails_engine__zsh_.jpg)

Wahoo!
