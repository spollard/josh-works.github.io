---
layout: post
title:  "Ruby Version Scripting in Codeship"
description: "How to dynamically set the ruby version when running Codeship"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [codeship, scripting, shell]
permalink: ruby-version-scripting-in-codeship
---


Text


## Using .ruby-version


Went from:

![old codeship](https://cl.ly/a3bb1f278d39/rvm-use-hard-coded-ruby.jpg)

to:

![new codeship](https://cl.ly/4f968b2902c7/rvm_use_ruby-version.jpg)

<!--more-->

breaking:

```shell
\curl -sSL https://raw.githubusercontent.com/wombatsecurity/codeship-scripts/master/packages/mysql-5.7.sh | bash -s
mysql -u root -P 3307 test < sql/threatsim_test.sql
if [ -f sql/eu_threatsim.sql ]; then mysql -u root -P 3307 -e "create database eu_threatsim_test"; fi
if [ -f sql/eu_threatsim.sql ]; then mysql -u root -P 3307 eu_threatsim_test < sql/eu_threatsim.sql; fi
cd landingpages
rvm install $(cat .ruby-version) --install
rvm use $(cat .ruby-version)
# screwing around with yes yes, gemset empty, etc.
yes yes | rvm gemset empty
gem install bundler
bundle install
```


### Resources

- [Ruby: Using a .ruby-version file (Codeship docs)](https://documentation.codeship.com/basic/languages-frameworks/ruby/#using-a-ruby-version-file)
- [How do I script a “yes” response for installing programs? (StackOverflow)](https://stackoverflow.com/questions/7642674/how-do-i-script-a-yes-response-for-installing-programs)
- [Use `rvm gemset empty` to make `bundle install` happy (Github: rvm/issues)](https://github.com/rvm/rvm/issues/3645)
- [please install libyaml and reinstall your ruby](https://stackoverflow.com/questions/15738883/please-install-libyaml-and-reinstall-your-ruby)