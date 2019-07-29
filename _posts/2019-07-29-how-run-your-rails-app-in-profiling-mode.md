---
layout: post
title:  "How to Run Your Rails App in Profiling Mode"
date:  2019-07-29 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails_performance, rails, data_dog]
permalink: how-to-run-your-rails-app-in-profiling-mode
---

Last time, I [wrote about setting up DataDog for your Rails application]({{ site.baseurl }}{% link _posts/2019-07-28-data_dog_setup.md %}). Even when "just" running the app locally, it is sending data to DataDog. 

This is super exciting, because I'm getting close to being able to glean good insights from DataDog's Application Performance Monitoring tool. 

For a variety of reasons, I want to run DataDog against the app as it is running locally, on my laptop. This will scale up to monitoring all this in `production`, but for now, I can rapidly experiment, and since we're not deploying anything (yet) I can freely experiment with gathering/interpreting all this data locally.

The problem with running the app locally is it's usually running on `development` mode, which means Rails does lots of stuff to make local development easier, but which makes actual page load time take longer.

Nate covered how to configure your app to run it in a "production-like" environment, locally, but I got tripped up in some of the minor details involved with porting generalized instructions to our specific codebase.

So, today, I'm going to explain how to run the app locally in a way that mimics production. Some of this will be specific to our app, but I some of it could be useful to anyone else with a Rails app

## Required changes to `config/development.rb`

Nate suggested setting these options in `development.rb`:

```ruby
# config/environments/development.rb
config.cache_classes = true
config.eager_load = true
config.serve_static_files = true # 4.2 or less
# config.public_file_server.enabled = true # 5.0 or more
config.assets.compile = false
config.assets.digest = true
config.active_record.migration_error = false
```
<!--more-->

Since we're turning off `assets.compile`, we have to tell the app to precompile assets before we start it. 

```
$ rake assets:precompile
```

When I start the app server, I get the following error:

```
[13022] ! Unable to load application: NoMethodError: undefined method `=~' for #<Pathname:0x00007ffc8b20f000>
/Users/joshthompson/wombat/threatsim-rails/threatsim/vendor/bundle/ruby/2.4.0/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/dependencies_patch.rb:107:in `load_path_to_real_path': undefined method `=~' for #<Pathname:0x00007ffc8b20f000> (NoMethodError)
	from /Users/joshthompson/wombat/threatsim-rails/threatsim/vendor/bundle/ruby/2.4.0/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/loadable_patch.rb:8:in `load'
	from /Users/joshthompson/wombat/threatsim-rails/threatsim/app/workers/license_violation_notice_worker.rb:15:in `<top (required)>'
```

That's coming from this method:

```ruby
# vendor/bundle/ruby/2.4.0/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/dependencies_patch.rb:105
def load_path_to_real_path(path)
    expanded_path = File.expand_path(path)
    expanded_path << '.rb' unless path =~ /\.r(?:b|ake)\Z/
    expanded_path
  end
end
```

Playing with the code and finding where it breaks, I "cheated" a fix in:

```ruby
# vendor/bundle/ruby/2.4.0/gems/rails-dev-boost-0.3.0/lib/rails_development_boost/dependencies_patch.rb:105
def load_path_to_real_path(path)
    path = path.to_s if path.class == Pathname # I added this
    expanded_path = File.expand_path(path)
    expanded_path << '.rb' unless path =~ /\.r(?:b|ake)\Z/
    expanded_path
  end
end
```

Now the app starts up. (I'm not sure what the long-term solution to this `load_path_to_real_path` method will be.)

I can click around the app, and I can see data showing up in the Datadog dashboard, [per the setup we did last time]({{ site.baseurl }}{% link _posts/2019-07-28-data_dog_setup.md %}):

![Data in Datadog](/images/2019-07-29-localhost-dd-01.jpg)

---------------------------------------

# How to toggle `profiling` mode

Eventually, as I move down the path of performance work, I'll want to be able to easily run the app with these changes made in  `config/environments/development.rb`.

For our whole team to work on this collectively, we'll need to be able to commit this code and make it easy to run in profiling mode. 

I don't want to just leave a big block of code commented out, with a comment like "swap commented blocks around to run in profiling mode".

This looks bad:

```ruby
# uncomment the following code for performance mode, while adding comments to the UNCOMMENTED block below. Switch back when done. 
# config.cache_classes = true
# config.eager_load = true
# config.serve_static_files = true # 4.2 or less
# config.assets.compile = false
# config.assets.digest = true
# config.active_record.migration_error = false

# comment this block out to run profiling mode, uncomment ^^
# reverse when done
config.cache_classes = false
config.eager_load = false
config.serve_static_files = false # 4.2 or less
config.assets.compile = true
config.assets.digest = false
config.active_record.migration_error = true
```

Nate (unsurprisingly) gave us a cleaner suggestion:

```ruby
config.cache_classes = !!ENV["PROFILE"]
config.eager_load = !!ENV["PROFILE"] 
config.serve_static_files = !!ENV["PROFILE"] 
config.assets.compile = !ENV["PROFILE"] 
config.assets.digest = !!ENV["PROFILE"] 
config.active_record.migration_error = !ENV["PROFILE"] 
```

Now, when you boot the server, just pass in `PROFILE=true` as an environment variable:

```
rails s PROFILE=true
```

There's a lot of double negatives in the `ENV["PROFILE"]` option, and I wanted to verify that I was setting these correctly. If you want to do the same, add the following to your `development.rb` and boot the app:

```ruby
# config/environments/development.rb
  config.cache_classes = true
  config.eager_load = true
  config.serve_static_files = true # 4.2 or less
  config.assets.compile = false
  config.assets.digest = true
  config.active_record.migration_error = false
  
  p "app boot settings"
  p "config.cache_classes is " + config.cache_classes.to_s
  p "config.eager_load is " + config.eager_load.to_s
  p "config.serve_static_files is " + config.serve_static_files.to_s
  p "config.assets.compile  is " + config.assets.compile .to_s
  p "config.assets.digest is " + config.assets.digest.to_s
  p "config.active_record.migration_error  is " + config.active_record.migration_error .to_s
```

When you boot the app, you'll see this printed out:

![settings](/images/2019-07-29-run-production-like-in-dev-01.jpg)

Now, you can re-work these lines to spot-check that you are reading your environment variables correctly:

```ruby
config.cache_classes = !ENV["PROFILE"]
config.eager_load = !ENV["PROFILE"]
config.serve_static_files = !ENV["PROFILE"] # 4.2 or less
config.assets.compile = !!ENV["PROFILE"]
config.assets.digest = !ENV["PROFILE"]
config.active_record.migration_error = !!ENV["PROFILE"]

p "app boot settings"
p "config.cache_classes should be true"
p "config.cache_classes is        " + config.cache_classes.to_s
p "config.eager_load should be true "
p "config.eager_load is        " + config.eager_load.to_s
p "config.serve_static_files should be true "
p "config.serve_static_files is        " + config.serve_static_files.to_s
p "config.assets.compile should be false " 
p "config.assets.compile  is       " + config.assets.compile .to_s
p "config.assets.digest should be true"
p "config.assets.digest is        " + config.assets.digest.to_s
p "config.active_record.migration_error should be false"
p "config.active_record.migration_error is        " + config.active_record.migration_error .to_s

```

If you forget to pass in `PROFILE=1` or `PROFILE=true`, all of the expected vs. actual results will be backwards. (Which shows that by _not_ running the app in profile mode, it's running in a normal `development` mode.)

![confirming all is good](/images/2019-07-29-run-production-like-in-dev-02.jpg)

Once you've spot-checked that you like what you've got, delete all the `print` statements, and commit the new code. Now your whole team can toggle on/off `profiling` mode, simulating a `production`-like environment will staying in the `development` group.

Next up, load testing the app with Siege, and seeing what Datadog tells us!
