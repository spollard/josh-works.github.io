---
layout: post
title:  "Workflow for developers (AKA My current tools)"
date:   17-05-29-06:18:52 -0600
categories: [programming tools]
permalink: developer-workflow
---

I'm a huge fan of "a good workflow". Makes you think better.

This is still under construction, but I'm fleshing out all the tools, tidbits, and other things that serve me well every day as I build my skills as a developer. It will always be a work in progress, but will hopefully serve others.

  <!--more-->

Workflow is more than just tools. It encompasses [how you ask questions](/better-questions) and [how you integrate new knowledge](/learning-how-to-learn). This page will be a running list of tools and workflows that I use regularly.

## Topics

### Small desktop/OS tweaks
  - [max out key repeat speed + min wait on key hold](#key-repeat-speed)
  - [Max resolution size on display](#see-more-code)


### iTerm
  - [Split panes: `cmd+d`/`cmd+shft+d`](#split-panes)
  - [Optimize prompt for information](#optimize-for-information)
  - up arrow, replay last command
  - `!foo` pulls last command that started with `foo`
  - keybindings to allow quick cursor movement
  - global key binding to open iTerm from anywhere.
  - set new tabs/panes to open from current working directory

### Git/Github
  - on group projects that need a "stable" branch at all times - set default branch to "staging".
  - PR Template
  - Minimize unnecessary merge conflicts by pulling in `staging/master` before making PR

### Chrome
  - "the great suspender" <- chrome
  - cmd+shft+[] to cycle tabs (chrome/atom)
  - Vimium

### clipboard management
  - jumpcut

### window management
  - moom/spectacle

### applications (some free, some not)
  - Dash: offline (and instant) documentation
  - Alfred w/Powerpack: do all the things
  - Flux (free)
  - TextExpander: expand commonly used chunks of text
  - skitch (screenshots)
  - cloudapp (gifs, sharing files)
  - PrivateInternetAccess (VPN)
  - barkeeper (control menu items)

### atom
  - create directories/files from inside of Atom
  - "lightweight" ruby linter
  - show whitespace
  - toggle tree view
  - split screen sideways
  - move between panes (and tabs)
  - insert new line above/below
  - cmd+d/u
  - global find

--------------------

# Desktop/OS tweaks

### Key repeat speed

Holding down the delete key should delete text _quickly_, and you shouldn't have to wait a long time for it to start deleting text.

`System Preferences > Keyboard`, max out key repeat speed, minimum delay until repeat:

<img src="/images/17-05-29-tools_1.jpg" alt="Keyboard Settings" style="width: 450px; margin: 0 auto; display: block;">

### See More Code

Most of us are on Macbooks with retina screens. The default resolution of your mac doesn't take advantage of this high-resolution capability.

There's a few different ways of showing the difference in resolution. I'll show one way, but ultimately, you should experiment yourself with maxing out the resolution and then bumping up the text size as needed. This allows the less-important parts of your tools take up less space (like sidebars, navigation elements, etc) while leaving you more room for what matters. (Code, text)

<img src="/images/17-05-29-display_1.jpg" alt="Keyboard Settings" style="width: 650px; margin: 0 auto; display: block;">

Compare the side bar in the first image to the one in the second. There's about 25% more visible items. This is a win, in my book. Laptop screens are small enough.

<img src="/images/17-05-29-display_2.jpg" alt="Keyboard Settings" style="width: 650px; margin: 0 auto; display: block;">

Change your resolution under `System Preferences > Displays > Built-in Retina Display`

<img src="/images/17-05-29-display_3.jpg" alt="Keyboard Settings" style="width: 400px; margin: 0 auto; display: block;">

# iTerm

iTerm is powerful. It can also be intimidating, because it's your window into the command line, github, and the dark depths of your machine. The more you can make it match your workflow, the less intimidating it will seem.

### Split Panes

You can split your iTerm panes, similar to how you might split Atom.

`cmd-d` splits iTerm vertically. `cmd-shift-d` splits it horizontally. I like to have all my windows related to a certain app under a single iTerm tab, so I might have two or three panes open, and when I want to see one pane better, I'll hit `cmd-shift-enter` to expand the pane to fill the entire iTerm window.

This is useful if I need to see a full stack-trace, or scroll back through server error messages. Once I'm done looking, I hit `cmd-shift-enter` again, and it shrinks back to its normal size.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">cmd+shft+d splits iTerm2 horizontally. Cmd+d splits vertically. hello, Fibonacci sequence: <a href="https://t.co/StnBubNoAU">pic.twitter.com/StnBubNoAU</a></p>&mdash; Josh Thompson (@josh_works) <a href="https://twitter.com/josh_works/status/853240281411584001">April 15, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Optimize for Information

Your terminal prompt is that little piece of text before your cursor that is visible pretty much all the time.

You spend _all day_ looking at your terminal prompt, so it's reasonable to ask it to work for you a bit.

I have two _minimum_ recommendations:
1. Change the color of JUST the prompt, so is contrasted compared to the output next to it.
2. Set up Git tab-completion AND display the current git branch in the prompt

Prompt:

As an example, where in this block of text did I enter the next command?

![hard to find the prompt, eh?](/images/17-05-29-prompt_2.jpg)

Hint, it's sorta in the middle, where it says `bash-3.2$ curl josh.works`

Compare that to this version:

![easier to find the prompt now, methinks](/images/17-05-29-prompt_1.jpg)

(Oops, shouldn't be making changes on `master`...)

To set this all up, carefully follow Michael Hartl's instructions on his [Learn Enough Git](https://www.learnenough.com/git-tutorial#sec-prompt_branches_and_tab_completion) tutorial. That will give you tab completion and the current branch in your prompt.

To change the color of your prompt, that's a bit more of a hassle.

Open up your `~/.bashrc`, and find the line that starts with `PS1`.

It should have somewhere inside of it the code you just added per Michael Hartl's tutorial. You need to update that line to the following:

`PS1='\[\e[0;32m\][\W$(__git_ps1 " (%s)")]$ \[\e[m\]'`

This just adds color codes (and color code escapes, and a bunch of other color-related formatting) to your "Prompt String 1". It's voodoo, and will suck away hours of your life if you let it.

I wrote about this topic in more detail here: [Gist on Prompt customization](https://gist.github.com/josh-works/7f2e6c82d22dca6e9fbc029c8b17703d)

### Links
- [Regis' iTerm tutorial (YouTube)](https://www.youtube.com/watch?v=d3gujjfzAfw&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=3)
- [Regis' Atom/Spectacle shortcuts (YouTube)](https://www.youtube.com/watch?v=uulWZVXOuxs&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=1)
