---
layout: post
title:  "Turing Prep appendix: Troubleshooting Errors"
date:  2019-05-19 07:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-troubleshooting-guide
---

### Index of this series:
- [Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %})
- [Turing Prep Chapter 2: Your first passing tests!]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %})
- [Turing Prep Chapter 3: Video walk-through of a few of the mythical creatures, like `unicorn.rb`, `dragon.rb`, and `hobbit.rb`]({{ site.baseurl }}{% link _posts/2019-05-31-turing_prework_03_mythical_creatures.md%})
- [**Turing Prep appendix: Troubleshooting Errors**]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %}) (This is what you're reading right now)

As you run into problems (and others) let me know. I'd like to collect a broad swath of the errors folks run into, and the solutions, so they don't get too caught up.

Here's a quick index of what's in this guide:

- [`Traceback... cannot load such file -- pry`](#traceback-cannot-load-such-file----pry)
- [cannot open Atom from the Terminal](#cannot-open-atom-from-the-terminal)
- [`FSPathMakeRef`](#fspathmakeref-and-a-bunch-of-other-stuff)
- [`gem install pry` failing with "you do not have permission"](#gem-install-pry-failing-with-you-do-not-have-permission)

## `Traceback... cannot load such file -- pry`

This seems like an intimidating error message at first. 

It's not. The error just says:

> Dear user, you've asked me to import code to run these tests, but I cannot find the code you require. 
>
> The code I was looking for (and cannot find) is called `pry`

Pry is an amazing tool. You'll soon come to love it. In the mean time, just install it. It's a ruby "gem" so you use the `gem install <gem_name>` command.

In your terminal, run `gem install pry` and then run the tests again. 

## Cannot open atom from the terminal

You may need to install the Atom Shell Commands. Atom makes it super easy to do this:

![install shell commands](/images/2018-09-14_turing_troubleshooting_01.jpg)

<!--more-->


## `FSPathMakeRef` and a bunch of other stuff

Here's an error one student saw:

`FSPathMakeRef(/Applications/Atom.app) failed with error -36.`

Googling around led here: https://github.com/atom/atom/issues/5222

One possible cause was the user's machine had two instances of `Atom.app` on it. (In this case, one was in the `Downloads` folder, the other in `Applications`. Delete one of them, try again.


## `gem install pry` failing with "you do not have permission"

If you get an error like this:

```console
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory.
```

Don't worry. We'll sort you out. It'll take some work. 

First, lets see which installed version of Ruby your computer is trying to use when you type `ruby`:

```shell
$ which ruby
```

If you get something that looks like this:
```shell
/usr/bin/ruby
```

We'll need to fix it. Read on.

If you get something like one of these:

```shell
/Users/joshthompson/.rbenv/shims/ruby
/Users/joshthompson/.rvm/rubies/ruby-2.3.3/bin/ruby
```

You're in good shape. Stop reading this section. The rest of this fix will not apply to you.

## `/usr/bin/ruby`

This means you're using the version of Ruby that came installed on your laptop. You shouldn't be messing with this version of Ruby, so your system isn't letting you.

To use Ruby safely, you'll need to install some tool to manage Ruby's environment. `rbenv` is the most common tool for this: [https://github.com/rbenv/rbenv](https://github.com/rbenv/rbenv)

You should have `[homebrew](https://brew.sh/)` on your computer already. If you don't figure out how to install it.

If you have it, here's a summary [of the instructions for MacOS](https://github.com/rbenv/rbenv#homebrew-on-macos):

```shell
$ brew install rbenv
$ rbenv init
```

Restart your terminal.

Now, make sure (again) that `rbenv` is working:

```shell
$ rbenv -v
```

You should get something like `rbenv 1.1.2` back.

Next, tell `rbenv` to install ruby 2.4.1:

```shell
$ rbenv install 2.4.1
```

And then set this version of ruby as the "global" version to use, until you tell it otherwise or a particular project specifies a different version:

```shell
$ rbenv global 2.4.1
```

You can now do `gem install pry`, and it will install the gem to the `2.4.1` version of Ruby, as managed by `rbenv`.