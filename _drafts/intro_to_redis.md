---
layout: post
title:  "Intro to Redis"
date:  2018-01-16 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, redis, databases, ruby, ruby_on_rails]
permalink: intro-to-redis
---

Pretty much all data on the internet lives in a database somewhere.

I'm working on better understanding the nuances of MySQL, but a bug I'm working on right now is taking me into our Redis database.

I'm trying to answer the question of "how can I query the Redis DB using the same params the Rails app is using, to see what's in the response?"

What is Redis, you might ask? It's a key-value storage... tool. Everything happens "in memory", so it's very quick. ([More on Wikipedia](https://en.wikipedia.org/wiki/Redis))

> Performance is Redis's killer feature. I get 80,000+ operations a second on my laptop - proper server hardware will get even more. It handles writes even faster than it handles reads, which makes it useful for a whole bunch of interesting problems. Because it's so fast, a whole class of features which most resource-constrained web applications would never even consider suddenly become feasible. - [Simon Williamson](https://web.archive.org/web/20120118030804/http://simonwillison.net/static/2010/redis-tutorial/)

Before my current role, I'd touched Redis precisely once, so this might be a worthwhile read if you, too are *brand new* to Redis.

I've already got Redis installed on my machine. I don't recall exactly what I did, but it was easy, and [all laid out in this guide](https://redis.io/topics/quickstart).

Once you think you've got it installed, test it in your terminal:

```shell
$ redis-cli
# ^ enter the redis 'repl'
> ping
=> PONG
```
(redis replies with PONG)

Everything working? Great! Lets get to exploring Redis.

<!--more-->

## Exploring Redis

First, there's two environments I'm working in:

- <s>Redis running locally, not attached to any external database</s> Even spinnig up a local instance of redis, it still connects to the one attached to my local instance of our web app. 😯
- Redis running as part of our web application, containing lots of information. (several thousand key:value pairs, as far as I can tell)

When I'm talking to Redis in our application, I have to access it via `rails console`, and prepend every redis command with `$redis.<command>`.

So, in the Rails console, I need to use `$redis.ping`, instead of just `ping`.

### Creating data

At this point, it might be helpful to read [why Redis is not just a `key:value` store, but a `variety_of_data_types:variety_of_data_types` store](https://redis.io/topics/data-types-intro)

Add some data (all snippets will be inside of `redis-cli` unless I specify otherwise)

```
>> set mykey myvalue
"OK"
```

(inside of `rails console`, you have to pass arguments inside of quotes, though it seems like you don't need to in `redis-cli`)

```
>> get mykey
"myvalue2"
```

You can do multiple SETs at once (Multiple SET: MSET)

```
>> mset a 10 b 20 c 30
OK
```

You can do multiple GETs at once, too. (MGET)

```
>> mget a b c
1) "10"
2) "20"
3) "30"
```

Here's a cool feature - you can set keys to expire after a certain amount of time.

```
>> mset 
```


### Basic commands

- `set`
- `get`
-



### Additional Reading

- [How to take advantage of Redis, adding it to your stack](http://oldblog.antirez.com/post/take-advantage-of-redis-adding-it-to-your-stack.html)
- [Intro to Redis (slideshare)](https://www.slideshare.net/dvirsky/introduction-to-redis-version-2)
- [Redis quickstart (from redis.io)](https://redis.io/topics/quickstart)
