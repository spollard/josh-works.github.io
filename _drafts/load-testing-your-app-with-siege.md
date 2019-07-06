---
layout: post
title:  "Load Testing your app with Siege"
date:  2019-07-02 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails_performance, rails, programming]
permalink: load-testing-your-app-with-siege
---


Last time, I dug into using [Apache Benchmark to do performance testing on a page that requires authentication to access]({{ site.baseurl }}{% link _posts/2019-06-28-apache_benchmark_load_testing_app_behind_login_page.md %}). 

Today, we'll figure out how to use `siege` to visit many unique URLs on our page, and to get benchmarks on that process. I'll next figure out performance profiling in Datadog, and with these three tools put together, we should be ready to make some meaningful improvements to our application. 

This series of posts is a direct result of Nate Berkopec's [The Complete Guide to Rails Performance](https://www.railsspeed.com/), with aid from his screencasts, as well as Steve Grossi's [Load Testing Rails Apps with Apache Bench, Siege, and JMeter](https://work.stevegrossi.com/2015/02/07/load-testing-rails-apps-with-apache-bench-siege-and-jmeter/). Armed with these resources, and standing on shoulders of giants, off we go. 

[Siege](https://www.joedog.org/siege-home/)'s description:
> Siege is an http load testing and benchmarking utility. It was designed to let web developers measure their code under duress, to see how it will stand up to load on the internet. Siege supports basic authentication, cookies, HTTP, HTTPS and FTP protocols. It lets its user hit a server with a configurable number of simulated clients. Those clients place the server “under siege.”

You can get siege with `brew install siege`.

I'm using it because it can run a _list_ of URLs you give it. Imagine your app is a store, and it lists a few thousand products. Each product should have a unique URL, something like `www.mystore.com/product-name`, or maybe `www.mystore.com/productguid-product-name`. That `product-guid` makes sure that you can have unique URLs, even if there are two items with the same product name.

Knowing what's in your database, you can easily concat `product-guid` and `product-name`, stick it to the end of `www.mystore.com`, and come up with a list of a hundred or a thousand or ten thousand unique product URLs in your application. If you saved these to a text file and instructied Siege to visit every single one of those pages as quickly as possible... this might look like some sort of good stress test, huh?

### Dumping unique URLs into a text file

You'll probably start working in a `rails console` session, to figure out how to access the URL scheme just right. 

I fired up the console, and entered:

```ruby
File.open("all_campaign_urls.txt", "a+") do |file|
  # this opens the file in write mode; will over-write contents of existing file
  Campaign.where(account_id: 4887).find_each do |campaign|
    puts "writing " + "http://localhost:3000/account/campaigns/" + campaign.to_param
    file.puts "http://localhost:3000/account/campaigns/" + campaign.to_param
  end
end
```
<!--more-->

I looked in our dev database to find an account with a lot of data; account with the id `4887` is an account associated with QA automation, and has lots of data in it. 

`campaign.to_param` is how we build URLs out of our campaigns - it just concats the `guid` with the `title` string, as provided by the customer, and calls `.parameterize` on it. For this batch of campaigns, they're generated programmatically by our automated QA test suite. 

When finished, you might see something like this in `all_campaign_urls.txt`:

![all campaigns](/images/siege_01.jpg)




More text


### Additional Resources

- [Load Testing Rails Apps with Apache Bench, Siege, and JMeter](https://work.stevegrossi.com/2015/02/07/load-testing-rails-apps-with-apache-bench-siege-and-jmeter/)
- [The Complete Guide to Rails Performance](https://www.railsspeed.com/)