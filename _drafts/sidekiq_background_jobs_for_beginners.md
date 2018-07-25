---
layout: post
title:  "Sidekiq and Background Jobs for Beginners"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [ruby, rails, sidekiq, background_jobs]
permalink: sidekiq-and-background-jobs-in-rails-for-beginners
---

I've recently had to learn more about background jobs (using Sidekiq, specifically) for some bugs I was working on.

I learned a lot. Much of it was *extremely* basic. Anyone who knows much at all about Sidekiq will say "oh, duh, of course that's true", but... it wasn't obvious to me.

The reason I needed such basic overviews is because prior to my current job, I'd had just a few _hours_ of exposure to background jobs, and understood little of those hours. And I got dropped into a project that has dozens of jobs, handling hundreds of thousands of actions a day. 

As is my style, when I don't understand something, I like to go to the very basics...

<!--more-->

I went back to Turing! I found the [background jobs lesson](http://backend.turing.io/module3/lessons/intro_to_background_workers) from Mod 3, and worked through it. 

I very much enjoy seeing evidence of things working "under the hood", rather than just accepting that `BackgroundWorker.perform_later(foo.id)` works differently than `BackgroundWorker.new.perform(foo.id)`, etc. So, this post will focus not as much on _using_ Sidekiq, but _seeing that it's working_. 

I worked through the tutorial, and now want to dig a bit deeper. 

If you want to follow along, do the above tutorial. [This is what my repo looks like right now](https://github.com/josh-works/turing_sidekiq_tutorial/tree/eb5ef7eb34f8baefab9d763c469d9917c09c7d3f). I'll recap most of what's in the tutorial.

To run the app, using multiple terminal tabs as needed:

```
redis-server
mailcatcher
rails s
```

First thing to note is in the `MailersController`, we have

(Later, we'll cover using `foreman` to manage all this.)

OK, the app is working. Navigate to localhost:3000, and you should see Missy Elliot in all her glory.

Open up http://localhost:3000/sidekiq/ to see the sidekiq dashboard, and then over to http://localhost:1080/ for mailcatcher. 

You'll notice that when sending emails via the app, nothing is happening on http://localhost:3000/sidekiq/, and the redis terminal window is untouched:

![redis](/images/2018-07-25_redis.jpg)


# Convert a non-background-job to a background job

The essence of a background job is to do stuff _in the background_, without making the Rails app sit around doing all the work. 

So, to simulate the pain of waiting for synchronous jobs, when you use this app, it inserts a five-second `sleep`, by default.

Lets make this a background job:

1. create the job. (you can use `rails generate job <job_name>`, per the [ActiveJob docs](https://edgeguides.rubyonrails.org/active_job_basics.html#create-the-job))
2. Call the `notify user job` from the controller, instead of calling the `user notifier` directly.

### Make the job

We'll hand-roll this. Make `app/jobs/send_user_gif_job.rb`.

```ruby
class SendUserGifJob < ActiveJob::Base
  queue_as :default
  
  def perform(*args)
    # do da ting
  end
  
end
```

(Deviated slightly from the docs with `ActiveJob::Base`. I'm working with Rails 4.2)

### Make the test

![tdd](https://imgflip.com/i/2eoan3)

Since much of the point of this post is figuring out how to test and verify Sidekiq jobs, it makes sense to get a failing test.

Working through the [rubyonrails.org docs on testing jobs](https://edgeguides.rubyonrails.org/testing.html#testing-jobs), I'll set up the following:

```ruby
# test/jobs/send_user_gif_job_test.rb

require 'test_helper'

class SendUserGifJobTest < ActiveJob::TestCase 
  test 'that email is sent' do
    SendUserGifJob.perform_now(args)
    # literally no idea what to assert here...
    # assert 
  end
  
end
```

I've no idea what to assert just yet, but we'll get there. Lets run the test!


### To do, later

add `ChatWorker`, Rails Logger, test all this?
