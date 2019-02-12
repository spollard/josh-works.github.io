---
layout: post
title:  "Intro Mini Profiler"
date:  2019-02-06
crosspost_to_medium: false
categories: [programming]
tags: [performance_tweaking, ruby, rails]
permalink: Mini-Profiler: Finding the slow spots
---

Setup is easy. Add the following to your `gemfile`, after your database gems:

```
gem 'ruby-prof'
gem 'rack-mini-profiler'
gem 'flamegraph'
gem 'stackprof'
gem 'memory_profiler'
```

