---
layout: post
title:  "`ls` command to show directory contents"
date:  2018-10-03 04:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [terminal, linux]
permalink: ls_command_recursively_list_directory_contents
---

I like to use the `tree` command on my local machine when trying to peek into the structure and contents of a given directory.

```
tree -L 2
```

will [L]ist recursively everything [2] levels deep from your current directory. The output is nicely formatted like this:

```
> tree -L 2
.
├── cargo
│   ├── ARCHITECTURE.md
│   ├── CONTRIBUTING.md
│   ├── Cargo.lock
│   ├── Cargo.toml
│   ├── LICENSE-APACHE
│   ├── LICENSE-MIT
│   ├── LICENSE-THIRD-PARTY
│   ├── README.md
│   ├── appveyor.yml
│   ├── rustfmt.toml
│   ├── src
│   ├── target
│   └── tests
├── fastly
│   └── fastly-test-blog
├── get-pip.py
├── learning_aws
├── learning_elixir
│   ├── hellow
│   ├── sample01.exs
│   └── sling_clone
├── learning_over_the_wire
│   ├── bandit
│   └── leviathan
├── learning_react
│   └── react_tutorial
├── learning_ruby_rails
│   ├── InstaClone
│   ├── blocks_practice.rb
│   ├── chris_pine_ruby_lessons
│   ├── eloquent_ruby
│   ├── email_sender
```

If you've SSHed into a linux box, however, and you're trying to look around a bit, you won't have `tree` available to you. How can you list out the contents of directories?

Easy. The good 'ol `ls` command:

<!--more-->


```
ls -1d ./*/*
```

results in:


```
> ls -1d ./*/*
./cargo/ARCHITECTURE.md
./cargo/CONTRIBUTING.md
./cargo/Cargo.lock
./cargo/Cargo.toml
./cargo/LICENSE-APACHE
./cargo/LICENSE-MIT
./cargo/LICENSE-THIRD-PARTY
./cargo/README.md
./cargo/appveyor.yml
./cargo/rustfmt.toml
./cargo/src
./cargo/target
./cargo/tests
./fastly/fastly-test-blog
./learning_elixir/hellow
./learning_elixir/sample01.exs
./learning_elixir/sling_clone
./learning_over_the_wire/bandit
./learning_over_the_wire/leviathan
./learning_react/react_tutorial
./learning_ruby_rails/InstaClone
./learning_ruby_rails/blocks_practice.rb
./learning_ruby_rails/chris_pine_ruby_lessons
./learning_ruby_rails/eloquent_ruby
./learning_ruby_rails/email_sender
```

`ls` is obviously "list". What about that `-1d` thing?

according to the man page:

```
-1   (The numeric digit ``one''.)  Force output to be one entry per line.  This is the
      default when output is not to a terminal.
         
-d   Directories are listed as plain files (not searched recursively).
```

to achieve a certain number of directories in depth, just repeat the `./*./*` pattern, one `/*` per directory depth you'd like to view. 

The output isn't always particularly readable - sometimes you get a ton of results. 

If this is the case, you could always pipe the output to `head`, or `grep` the output. That said, I've used this general pattern regularly, and it's been helpful.


### Related resources

- [List subdirectories only n level deep (unix.stackexchange.com)](https://unix.stackexchange.com/questions/93323/list-subdirectories-only-n-level-deep)