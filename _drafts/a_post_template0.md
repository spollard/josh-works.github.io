---
layout: post
title:  "Setting up Application Performance Monitoring in DataDog in your Rails App"
date:  2019-07-17 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails_performance, rails, programming]
permalink: data-dog-apm-rails-app-setup
---

_When I write guides to things, I write them first and foremost for myself, and I tend to work through things in excruciating detail. You might find this to be a little too in-depth, or you might appreciate the detail. Either way, if you want a step-by-step guide, this should do it._

As mentioned in POST, I want to get Application Performance Monitoring in place for our app. We use Rails. 

To someone who doesn't know much about this space, there was more friction than I expected. 

I'll wander around, get everything set up, and outline any places that I bump into stuff.

First, DataDog has a handy video about how to configure your app to use APM:

https://docs.datadoghq.com/videos/rails/

Unfortunately, the link they give in the video to [https://app.datadoghq.com/apm/docs](https://app.datadoghq.com/apm/docs) redirects to [https://app.datadoghq.com/apm/intro](https://app.datadoghq.com/apm/intro), which _fails to tell you how to find the actual docs_. 🙄

So, I found [https://docs.datadoghq.com/tracing/](https://docs.datadoghq.com/tracing/), which don't look anything like what's in the video. Docs go out of date, this isn't a problem.

It looks like the setup involves a few steps:

1. Enable Trace collection in the Datadog Agent
2. Instrument your application to send traces to your Datadog Agent
3. Enable Trace Search & Analytics
4. Enrich tracing

I don't know that we'll get to step 4, but 1-3 look great.

# Enable Trace collection in the Datadog Agent

There's a lot of complexity boiled into this short little paragraph:

> Install and configure the latest Datadog Agent. (On macOS, install and run the Trace Agent in addition to the [Datadog Agent](https://docs.datadoghq.com/tracing/setup/python/). See the [macOS Trace Agent documentation](https://github.com/DataDog/datadog-agent/tree/master/docs/trace-agent#run-on-macos) for more information). APM is enabled by default in Agent 6, however there are additional configurations to be set in a containerized environment including setting `apm_non_local_traffic: true`. To get an overview of all the possible settings for APM including setting up APM in containerized environments such as [Docker](https://docs.datadoghq.com/agent/docker/apm/?tab=java) or [Kubernetes](https://docs.datadoghq.com/agent/kubernetes/daemonset_setup/?tab=k8sfile), get started [Sending traces to Datadog](https://docs.datadoghq.com/tracing/send_traces/).

<!--more-->
Surely I'm not the only person that finds this to be a bit complex, but the whole point of this blog post is to sort all this out. 

We'll break _this single step_ into its actual component sub-steps, as appropriate for a "standard" Rails app.

## Install and configure the latest Datadog Agent

So, hopping over to the link for [the latest Datadog Agent](https://docs.datadoghq.com/tracing/setup/python/), my first thought is _why the heck is this about Python_? Their docs link to the `python` section of the docs, not an overview of a list of available languages.

The Ruby setup is here: [https://docs.datadoghq.com/tracing/setup/ruby/](https://docs.datadoghq.com/tracing/setup/ruby/)


So, we're here:

![datadog docs](/images/2019-07-17-datadog_01.jpg)

It's about now that I'm wondering what _is_ the "DataDog Agent".

[The docs](https://docs.datadoghq.com/agent/?tab=agentv6) say:

> The Datadog Agent is software that runs on your hosts. It collects events and metrics from hosts and sends them to Datadog, where you can analyze your monitoring and performance data.

On the ruby setup page, it says:

> The Ruby APM tracer sends trace data through the Datadog Agent.


That... sorta answers the question. I'm not sure _where_ I would install it. It says it "runs on your hosts", so... I guess I have to get this on our hosts somewhere? 

We'll proceed through the setup. Sigh. I really don't like these docs. They're self-referential, and not helping me build a mental model of what I'm trying to do. So we'll keep blindly pushing along.

### Add the `ddtrace` gem to your Gemfile

We already have [`dogstatsd-ruby`](https://github.com/datadog/dogstatsd-ruby) in the Gemfile, which is also a `datadog` gem. Oh well. Onward.

`bundle install` and create the specified config file:

```ruby
# config/initializers/datadog.rb
require 'ddtrace'
Datadog.configure do |c|
  # This will activate auto-instrumentation for Rails
  c.use :rails
end
```

Wooow. That's the end of this section. The docs say:

> After setting up, your services will appear on the APM services page within a few minutes. Learn more about using the APM UI.

So, I assume this means after I deploy our app with the updated configuration. 

The link to the APM services page is https://app.datadoghq.com/apm/services, but the URL redirects to https://app.datadoghq.com/apm/intro, which tells me nothing about next steps. It looks like a marketing page without a clickable CTA or next-step. 

We're obviously not just going to blindly deploy this in our next release, so this would be an _excellent_ spot to know about sandboxing options, or test/demo modes, etc.

I'm pausing this guide here to send an email to their support team. 


