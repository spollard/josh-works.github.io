---
layout: post
title:  "Switching to Jekyll"
date:   2017-05-15 06:18:52 -0600
categories: writing
tags: [blogging, jekyll]
permalink: switching-to-jekyll
---

## Why I switched to Jekyll

A few days ago, I was _really_ feeling the urge to write a short little blog post. So, I put it in a [gist](https://gist.github.com/josh-works) on Github.

I'm an advocate of writing publicly, and making it a habit, so why was I putting it in a gist, instead of here, on my website, where I theoretically can write and publish _anything I want_?

_Friction_

It's very easy for me to sketch out a quick document with embedded screenshots in a text editor. I spend most of my day in a text editor anyway, so it's trivially easy to write a new document.

I can add code snippets, links, images, and have nicely formatted text, just the way that I like it, in a gist.

SquareSpace, the service I _was_ using for my website, is not designed for people who write in Markdown. SquareSpace is very good at many things, but not the things I needed. [Practically Efficient](http://www.practicallyefficient.com/2016/04/03/static-and-free.html) says it better than I can.

So, last week, I decided that if I didn't make my writing and publishing easy, I would probably just stop writing.
<!--more-->

## What is Jekyll?

Jekyll is a "blog-aware static site generator that can run on Github Pages" [(source)](https://jekyllrb.com/).

All of these check off the "nice-to-have" boxes I'd look for. And now that I'm spending all day writing code, and inside of a text editor, and using Github, getting to merge my Git workflow with blogging is sorta perfect.

Plus, Jekyll is written in Ruby, so it has lots of pieces I'm quite familiar with by now.

I pulled from lots of articles others had written, to figure out all sorts of little tweaks. Here's the list that I drew most heavily from:

## Initial Resources I used to start

- [Using the Poole theme](http://joshualande.com/jekyll-github-pages-poole)
- [Enabling SSL connections with Github pages and a custom domain](https://rck.ms/jekyll-github-pages-custom-domain-gandi-https-ssl-cloudflare/)
- [setting up reasonable post short-links](http://joshualande.com/short-urls-jekyll)
- [Add email subscription box to jekyll blog](http://www.controlfd.com/2016/05/16/add-a-mailchimp-subscriber-form-to-your-jekyll-blog.html)
- [Google Analytics setup for Jekyll](https://michaelsoolee.com/google-analytics-jekyll/)
- [Add and manage post excerpts](https://coderwall.com/p/eazb7w/easily-create-blog-post-excerpts-for-jekyll-and-github-pages)
- [Ruby script to parse SquareSpace XML archive into Jekyll-friendly posts (with images!)](https://gist.github.com/spiffytech/e73777e167dc5a8b6a87)
- [Adding "related posts" tool](https://elliotekj.com/2016/12/05/jekyll-create-a-list-of-all-posts-in-the-same-category/) (I'm not currently satisfied w/my current implementation)
- [Add meta description in Jekyll posts](https://sarathlal.com/add-meta-description-in-jekyll-posts/) ([This is the commit where I added it, if the above directions caused you some confusion too](https://github.com/josh-works/josh-works.github.io/commit/d73080031d87390e165b84fcb678760f488375df))


And that's about it. It's been an amazing experience, porting everything over to Jekyll.

There are still some modifications I want to make, like how code snippets run off the edge of the page if the lines are long, but this is lower priority.

There's still plenty for me to learn with Jekyll, but I'm getting there.

Until then, I'll probably be posting a lot more online. Since it's so easy.


## Additional resources I've made use of since 2017

Since switching to Jekyll in 2017, I've made additional changes. I'll list useful resources here as I go.

- [Jekyll Pure Liquid Table of Contents](https://github.com/allejo/jekyll-toc) Auto-generate Table of Contents, _no javascript required_. So nice.
- [Jekyll Pure Liquid Heading Anchors](https://github.com/allejo/jekyll-anchor-headings)

## Misc other notes

I recently made [this gist](https://gist.github.com/josh-works/a78f0f904af8b18123c2b9b48387722d) to help mod 1 backend Turing students get up and running on Jekyll. I'll convert that gist to a proper page on my website soon.
