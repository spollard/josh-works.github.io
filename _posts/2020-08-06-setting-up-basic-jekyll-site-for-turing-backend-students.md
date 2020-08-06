---
layout: post
title:  "Build a Personal Website in Jekyll - A Detailed Guide For First-Timers"
description: "When I started using Jekyll, I found it rather intimidating. Now I :heart: it and hope you will too!"
date:  2020-08-06 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [turing, ruby, jekyll]
permalink: build-a-personal-site-with-jekyll
image: /images/title_image.jpg
---


You're a turing student, in the backend program. 

You know Ruby, you wanna start blogging, but everyone who says
> go start a blog

Seems to also think you have 10 hours (or 20 hours? or 2 hours? how long does this take) to sit around dealing with setting up a personal website.

Lets set one up.

### Intended audience: 

Turing Mod 1 backend student, or ambitious mod-0 student

### Output and expected results

Have a basic site online, at `your-github-username.github.io` that looks professional enough you could share it with a future employer, but puts the main emphasis on your words, not the flashyness of the page or complexity of the technology.

My website (the one you're reading on right now) looks pretty simple, and I know how to set it up, so we'll _start_ with setting up something similar to my website, and I'll show you how to use different templates as well.

### 1. Get started with basic jekyll/theme combination

Head to [https://github.com/poole/poole](https://github.com/poole/poole), and hit the `clone or download` url.

In your terminal, make a new dirctory, perhaps in your pre-existing `turing` directory

```shell
$ cd ~/turing

# Here's we're cloning the repo, but placing it inside of a folder _we_ define name
$ git clone <url from that `poole` repository> jekyll-site

$ cd jekyll-site

$ bundle install
# if `bundle install` throws error, do `gem install bundler`, then re-try `bundle install`

$ bundle exec jekyll serve
```

Now the server should be running.

Now, in a web browser, visit the given url:

![server running](https://p64.f2.n0.cdn.getcloudapp.com/items/GGukgv9R/2020-05-21%20at%2012.34%20PM.jpg?v=63d74cf95de2c35b20ef3b8f0cbc1521)


##### Sidebar - what the heck _is_ Jekyll? How does this thing turn into a website that people can visit?

great question! Holy cow.

Jekyll's documentation assumes a strong knowledge of how the internet works.

> Transform your plain text into static websites and blogs

What does this mean? What's a "static site generator"? Why do some people even care so much?

_more to come soon_

### 2. Learn the basics of how Jekyll works, so you can customize it to your liking

Lets figure out the important parts of this new directory. 

#### `_config.yml`

the `.yml` extension stands for "Yaml Ain't Markup Language", which is the punchline to a joke. 

`.yml` is format common in Ruby for writing machine-readable setttings that are equally easy for humans to understand. So, your Jekyll site will use this file to set basic settings, but it's easy for you to modify the values yourself.


Here's the first two changes you should make on your site:
![first change](https://p64.f2.n0.cdn.getcloudapp.com/items/QwuKZYlA/jekyll_config.jpg?v=7e79afd04591ee5608c8cd8eacbc4711)

Look at lines 2 and 3 in my editor - try making those changes, then make them show up in your browser. Don't forget to restart your server! (hit `ctrl-r` to kill it.)

### 3. Set up github repo to host your site

From github's instructions:

> Head over to [GitHub](https://github.com/) and [create a new repository](https://github.com/new) named username.github.io, where username is your username (or organization name) on GitHub.
>
> If the first part of the repository doesn’t exactly match your username, it won’t work, so make sure to get it right.

Once you've done that, clone the repository:

```
git clone https://github.com/username/username.github.io
```

In that new directory, you'll need to place your Jekyll site. If you want to keep working with the `poole` theme we've worked with, you will need "connect" your Jekyll site locally to this new repository.

Lets first create a new directory at the root of your laptop for your website. 

```shell
mkdir ~/your-github-username.github.io
cd your-github-username.github.io
mv ~/turing/jekyll-site .
```

Now, lets connect your github repo to this repository:

```shell
$ git init
$ git add .
$ git commit -m "Initial commit"

$ git remote -v
# should come back empty

$ git remote add origin <your clone-this-repo url from above>

$ git push origin master
```

And, when you visit that URL, you should see all your files up there! 



# Customizing your new jekyll site

I'd recommend setting up a _very_ basic landing page. It's what my home page looks like, and it'll probably work for you.

Here's how:

![change index.html to index.md](https://p64.f2.n0.cdn.getcloudapp.com/items/5zuXZPZ6/2020-06-02%20at%209.20%20AM.jpg?v=cce72c77655716fb04e5d1e01882c66b)

Then delete all that stuff, and make it your own:

![add three sections](https://p64.f2.n0.cdn.getcloudapp.com/items/RBuq5Zw2/2020-06-02%20at%209.23%20AM.jpg?v=f6133f42c832e023da95a16b4a45dbf5)

Then fill it out and make it your own!

Here's what I might write, if I were doing this for myself:

![it would look like this](https://p64.f2.n0.cdn.getcloudapp.com/items/xQuDKxnz/2020-06-02%20at%209.26%20AM.jpg?v=4fe24cf63e185e7df22a1edf883d86e5)

And here's how it would look running locally:

![running locally](https://p64.f2.n0.cdn.getcloudapp.com/items/mXuAd2rB/2020-06-02%20at%209.27%20AM.jpg?v=a3dc52ab0976aa55bf6a695cc2d41344)

I didn't like how large the headings were, so instead of H1s (`#`), I went with H2: `##` before each section.




### Additional resources
- [https://josh.works/switching-to-jekyll](https://josh.works/switching-to-jekyll)
- [https://jekyll-themes.com/](https://jekyll-themes.com/)
