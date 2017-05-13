---
layout: post
title:  "On Cleaner Controllers"
date:   2017-05-09 06:18:52 -0600
categories: programming rails refactoring
permalink: cleaner-controllers
---

A few days ago, I worked on a project that was mostly about serving up basic store data (modeled after Etsy) to an API.

We had a few dozen end-points, and all responses were in JSON.

Most of the action happened inside of our controllers, and as you might imagine, our `routes.rb` file was bananas.

One of the instructors made an exceptionally simple suggestion, I was embarrassed to not have seen it.

It was about nesting our controllers a bit better.

For context, here's our routes for our merchants objects, relationships, and analytics:

```ruby
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
```

<!--more-->


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

```ruby
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
```
That looks a lot better. Half the number of references to `merchants` in the routes. Now... this requires renaming all the controllers, etc, so lets make that happen and see if our tests still pass.

We'll have to update a few files for each of these changes:

- `routes.rb`
- the associated controller (fixing the class name of the controller)
- The associated view, since the expected path is determined by the controller class name.

So, swap everything around, and all the tests still pass, and our routes are way more readable:



## Update

So this happened:

<!-- {% twitter https://twitter.com/mufid/status/863406182962053121 %} -->
![tweets](https://cl.ly/0s2R3S3r1r2i/%EF%BC%B6%EF%BD%85%EF%BD%92%EF%BD%89%EF%BD%86%EF%BD%89%EF%BD%85%EF%BD%84_%EF%BC%A1%EF%BD%83%EF%BD%83%EF%BD%8F%EF%BD%95%EF%BD%8E%EF%BD%94_on_Twitter____josh_works__sehurlburt_Nice__Btw__to_make_it_more_DRY__you_can_omit_path_reference__Rails_will_use_the_r)

What's that? A chance for even *more* refactoring?

I'll take it. Back to `routes.rb`

I immediately was able to get down to replying on Rails "convention over configuration", which basically means Rails is going to look in specific places for specific things. Like in the `/controllers/api/v1/merchants/` directory for most of my merchants controllers.

I was able to get down to THIS with all my tests still passing:
```ruby
Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants" do
        get "items", to: "items#index"
        get "invoices", to: "invoices#index"
        get "customers_with_pending_invoices", to: "merchants/pending_customers#index"
        get "favorite_customer", to: "merchants/favorite_customer#show"
        get "revenue", to: "merchants/revenue_by_merchant#show"
        collection do
          get "most_items", to: "merchants/most_items#index"
          get "most_revenue", to: "merchants/most_revenue#index"
          get "revenue", to: "merchants/revenue#show"
          get "find", to: "find#show"
          get "find_all", to: "find#index"
          get "random", to: "random#show"
        end
```

But look at these lines:

```ruby
get "favorite_customer", to: "merchants/favorite_customer#show"
get "revenue", to: "merchants/revenue_by_merchant#show"
collection do
  get "most_items", to: "merchants/most_items#index"
  get "most_revenue", to: "merchants/most_revenue#index"
  get "revenue", to: "merchants/revenue#show"
```

Tests fail when I pull out those paths.

When I run `rake routes`, this is my output:

```shell
api_v1_merchant_items GET  /api/v1/merchants/:merchant_id/items(.:format)                           api/v1/items#index {:format=>:json}
                      api_v1_merchant_invoices GET  /api/v1/merchants/:merchant_id/invoices(.:format)                        api/v1/invoices#index {:format=>:json}
api_v1_merchant_customers_with_pending_invoices GET  /api/v1/merchants/:merchant_id/customers_with_pending_invoices(.:format) api/v1/merchants/pending_customers#index {:format=>:json}
             api_v1_merchant_favorite_customer GET  /api/v1/merchants/:merchant_id/favorite_customer(.:format)               api/v1/merchants/favorite_customer#show {:format=>:json}
                       api_v1_merchant_revenue GET  /api/v1/merchants/:merchant_id/revenue(.:format)                         api/v1/merchants/revenue_by_merchant#show {:format=>:json}
                   most_items_api_v1_merchants GET  /api/v1/merchants/most_items(.:format)                                   api/v1/merchants/most_items#index {:format=>:json}
                 most_revenue_api_v1_merchants GET  /api/v1/merchants/most_revenue(.:format)                                 api/v1/merchants/most_revenue#index {:format=>:json}
                      revenue_api_v1_merchants GET  /api/v1/merchants/revenue(.:format)                                      api/v1/merchants/revenue#show {:format=>:json}
                         find_api_v1_merchants GET  /api/v1/merchants/find(.:format)                                         api/v1/find#show {:format=>:json}
                     find_all_api_v1_merchants GET  /api/v1/merchants/find_all(.:format)                                     api/v1/find#index {:format=>:json}
                       random_api_v1_merchants GET  /api/v1/merchants/random(.:format)                                       api/v1/random#show {:format=>:json}
                              api_v1_merchants GET  /api/v1/merchants(.:format)                                              api/v1/merchants#index {:format=>:json}
                               api_v1_merchant GET  /api/v1/merchants/:id(.:format)                                          api/v1/merchants#show {:format=>:json}
                          api_v1_item_merchant GET  /api/v1/items/:item_id/merchant(.:format)                                api/v1/items/items_merchants#show {:format=>:json}
                       api_v1_invoice_merchant GET  /api/v1/invoices/:invoice_id/merchant(.:format)                          api/v1/invoices/invoice_merchants#show {:format=>:json}
```

Lets pick apart the `pending_customers` path.

```shell
api_v1_merchant_customers_with_pending_invoices GET  /api/v1/merchants/:merchant_id/customers_with_pending_invoices(.:format) api/v1/merchants/pending_customers#index {:format=>:json}
```

that is generated by:

```ruby
get "customers_with_pending_invoices", to: "merchants/pending_customers#index"

```

lets see what happens with

```ruby
get "customers_with_pending_invoices", to: "pending_customers#index"

```

```shell
api_v1_merchant_customers_with_pending_invoices GET  /api/v1/merchants/:merchant_id/customers_with_pending_invoices(.:format) api/v1/pending_customers#index {:format=>:json}
```

Interesting. It dropped the `/merchants/` from the endpoint path. That is not what I expected, especially because it is still nested under `merchants` in my routes file. Hm.

Well, on further investigation, looks like the `PendingCustomersController` didn't even _need_ to be nested inside of /merchants. It relies on a parameter passed into it (the merchant ID) but the routes that we told it to live at doesn't require a merchant object in the path.

Rejigger some of the folder names and locations, and everything still passes.

This was a really good thing for me to learn about how Rails assumes controllers and views should be organized. It feels better to not override it's default behavior, or to be verbose in describing where controllers should go.

Here's the current routes structure, and all tests still pass:

```ruby
Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show], :controller => "merchants" do
        get "items", to: "items#index"
        get "invoices", to: "invoices#index"
        get "customers_with_pending_invoices", to: "pending_customers#index"
        get "favorite_customer", to: "favorite_customer#show"
        get "revenue", to: "merchants/revenue_by_merchant#show"
        collection do
          get "most_items", to: "merchants/most_items#index"
          get "most_revenue", to: "merchants/most_revenue#index"
          get "revenue", to: "merchants/revenue#show"
          get "find", to: "find#show"
          get "find_all", to: "find#index"
          get "random", to: "random#show"
        end
      end
```

I didn't pull out the last few references to merchants, because, well, I'm short on time. But this will be helpful going forward, next time I'm building out routes.



![tests pass](https://cl.ly/2w2R2D0s2s15/1__joshthompson_Joshs-MBP-55____turing_3mod_projects_rails_engine__zsh_.jpg)

Tests still pass! Wahoo



{% include newsletter.html %}
