---
layout: post
title:  "The Complete Guide to Rails Performance: basic setup"
date:  2018-11-29 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails_performance, rails, programming]
permalink: rails_performance_course_basic_setup 
---

You know the feeling. 

You are excited to start a guide or a tutorial. You buy it, crack it open, and start working through the environment setup.

Then... something goes wrong. Next thing you know, you've spent ~~two~~ ~~three~~ too many hours debugging random crap, and you're not even done with the introduction to the dang thing.

Oh, this has never happened to you? Must be nice.

I'm working through [The Complete Guide to Rails Performance](https://www.railsspeed.com/), and I'm thrilled to get learning underway. 

I've hit a few hiccups, though. I'm not the most sophisticated user out there, so here's a mess of problems I ran into, and the solutions I did.

## Elastic Search

All of my struggles were with ElasticSearch. I've never used it before, so this isn't surprising.

[The RubyGems docs](https://github.com/rubygems/rubygems.org/blob/master/CONTRIBUTING.md#environment-os-x) recommend the following:


> Install Elastic Search:
> 
>   - Pull ElasticSearch 5.1.2 : `docker pull docker.elastic.co/elasticsearch/elasticsearch:5.1.2`
>   - Running Elasticsearch from the command line:
> ```
> docker run -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" docker.elastic.co/elasticsearch/elasticsearch:5.1.2
> ```

<!--more-->

## Docker container, exit code 137

The docker container was instantly exiting with a [137 exit code](https://success.docker.com/article/what-causes-a-container-to-exit-with-code-137). That means its out of memory. 

I fixed this in the Docker app directly, but just bumping the memory allocated to the containers, and hitting the "save/restart" button. 

![bump the memory](/images/2018-11-29 at 9.04 PM.jpg)

Now I could run:

`bundle exec rake environment elasticsearch:import:all DIR=app/models FORCE=y`

Which brought me to:

## Elasticsearch...Unauthorized: [401]

I got 

```
Elasticsearch::Transport::Transport::Errors::Unauthorized: [401]
```

Sigh. Googled around, no quick solutions. 

So, I hunted through the Slack group for the course, and saw someone suggest just `brew installing` ElasticSearch. 

Done.

`brew install elasticsearch`

It installs `6.5.1` by default. This isn't the recommended version, but... we'll carry onward.

I can run `elasticsearch` in the terminal now, and get a lot of output.

Trying `bundle exec rake environment elasticsearch:import:all DIR=app/models FORCE=y` again, and we get:

```
> bundle exec rake environment elasticsearch:import:all DIR=app/models FORCE=y
[IMPORT] Loading models from: app/models
[IMPORT] Processing model: Rubygem...
[IMPORT] Done
```
Woot!

Lets try the tests.

I'll start `memcached`. Since it just hangs, filling up a terminal tab, lets [send it to the background](https://stackoverflow.com/questions/13338870/what-does-at-the-end-of-a-linux-command-mean):

```
> memcached &
```

and:

```
bundle exec rake
```

Sweet. Just rows upon rows of sweet green dots.... and a failure. 

![so close](/images/2018-11-29 at 8.50 PM.png)

## DependencyTest

The error is:

```
Failure:
DependencyTest#test_: 
  with a Gem::Dependency that refers to a Rubygem that exists and has multiple requirements should create a Dependency referring to the existing Rubygem. 
[/Users/joshthompson/workspace/rails_speed/rubygems.org/test/unit/dependency_test.rb:96]:
Expected: "< 1.0.0, >= 0.0.0"
  Actual: ">= 0.0.0, < 1.0.0"
```

We'll table this for now. 

Starting the server works fine. I'll update this post if I sort out the test failure. 

If you elect to work through the course, this might save you a bit of hassle. I went way too far down the docker hole before just brew installing it. :(