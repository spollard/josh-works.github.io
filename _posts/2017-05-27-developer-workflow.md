---
layout: post
title:  "Workflow for developers (AKA My current tools)"
date:   17-05-29-06:18:52 -0600
categories: [programming tools]
permalink: developer-workflow
---

I'm a huge fan of "a good workflow". Makes you think better.

This is still under construction, but I'm fleshing out all the tools, tidbits, and other things that serve me well every day as I build my skills as a developer. It will always be a work in progress, but will hopefully serve others.

Last updated 06/02/17. If you're curious, version history [here](https://github.com/josh-works/josh-works.github.io/commits/master/_posts/2017-05-27-developer-workflow.md)

<!--more-->

Workflow is more than just tools. It encompasses [how you ask questions](/better-questions) and [how you integrate new knowledge](/learning-how-to-learn). This page will be a running list of tools and workflows that I use regularly.

## Topics

### Small desktop/OS tweaks, misc utilities
  - [max out key repeat speed + min wait on key hold](#key-repeat-speed)
  - [Max resolution size on display](#see-more-code)
  - [Jumpcut: Clipboard buffering](#jumpcut-for-clipboard-buffering)
  - [Moom/Spectacle: Window management](#manage-your-windows)


### iTerm
  - [Split panes: `cmd+d`/`cmd+shft+d`](#split-panes)
  - [Optimize prompt for information](#optimize-for-information)
  - [`!foo` pulls last command that started with `foo`](#pulling-up-previous-commands)
  - [keybindings to allow quick cursor movement](#navigate-iterm-output-quickly)
  - [global key binding to open iTerm from anywhere](#global-key-binding)
  - [set new tabs/panes to open from current working directory](#reuse-current-working-directory-for-new-tabspanes)

### Atom
  - [Misc valuable (to me) packages](#atom)
  - [Split screens](#splitting-screens-for-fun-and-profit)
  - [Insert new line above/below](#new-lines-where-you-want-them)
  - [Global Find](#find-all-the-things)

### Git/Github
  - [on group projects that need a "stable" branch at all times - set default branch to "staging"](#use-a-staging-branch-for-group-work)
  - Pull Request Template
  - [Minimize unnecessary merge conflicts by pulling in `staging/master` before making PR](#always-merge-staging-into-your-branch-before-making-a-pull-request)
  - [Display current branch in terminal prompt](#optimize-for-information))

### Chrome
  - [Chrome Extensions, like The Great Suspender, Vimium, etc](#extensions)
  - [Chrome shortcuts](#shortcuts-for-chrome)


### applications (some free, some not)
  - [Dash: offline (and instant) documentation](#dash-documentation-that-doesnt-suck)
  - [Alfred w/Powerpack: do all the things](#alfred-do-anything-on-your-computer)
  - [Flux (free)](#flux-save-your-eyes)
  - [PIA (VPN)](#browsing-securely-with-pia)


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

### Jumpcut for clipboard buffering

Copy-paste makes the world go around. What if you want to copy two things to your clipboard, and then paste them both?

Or what if you copied a URL, and then a few minutes later (and after putting more stuff on your clipboard) you decided you wanted that URL again?

Enter "Clipboard buffering". With [JumpCut](http://jumpcut.sourceforge.net/) (it's free), you can cycle back through the last 40 items you've copied to your clipboard.

_I use this tool many times a day_

`cmd-v` is the system default for pasting from the clipboard, so I've mapped my JumpCut toggle to `cmd-opt-v`.



### Manage your windows

We spend all day moving between programs and windows. Surprise surprise, there are some great tools for customizing how your desktop looks.

I use [Moom](https://manytricks.com/moom/), others use [Spectacle](https://www.spectacleapp.com/). I prefer Moom because it has a bit more customization, but it's up to you. Both are free.

<img src="/images/17-05-31-moom.jpg" alt="Moom defaults" style="width: 650px; margin: 0 auto; display: block;">

#### Spectacle video
[Regis gives a great overview of using Atom and Spectacle shortcuts (YouTube)](https://www.youtube.com/watch?v=uulWZVXOuxs&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=1)

# iTerm

iTerm is powerful. It can also be intimidating, because it's your window into the command line, github, and the dark depths of your machine. The more you can make it match your workflow, the less intimidating it will seem.

### Split Panes

You can split your iTerm panes, similar to how you might split Atom.

`cmd-d` splits iTerm vertically. `cmd-shift-d` splits it horizontally. I like to have all my windows related to a certain app under a single iTerm tab, so I might have two or three panes open, and when I want to see one pane better, I'll hit `cmd-shift-enter` to expand the pane to fill the entire iTerm window.

This is useful if I need to see a full stack-trace, or scroll back through server error messages. Once I'm done looking, I hit `cmd-shift-enter` again, and it shrinks back to its normal size.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">cmd+shft+d splits iTerm2 horizontally. Cmd+d splits vertically. hello, Fibonacci sequence: <a href="https://t.co/StnBubNoAU">pic.twitter.com/StnBubNoAU</a></p>&mdash; Josh Thompson (@josh_works) <a href="https://twitter.com/josh_works/status/853240281411584001">April 15, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

(When you set this up, if you've not already, [configure iTerm to open new tabs to your current working directory](#reuse-current-working-directory-for-new-tabs-panes))

### Optimize for Information

Your terminal prompt is that little piece of text before your cursor that is visible pretty much all the time.

You spend _all day_ looking at your terminal prompt, so it's reasonable to ask it to work for you a bit.

I have two _minimum_ recommendations:
1. Change the color of JUST the prompt, so is contrasted compared to the output next to it.
2. Set up Git tab-completion AND display the current git branch in the prompt

#### Compare default prompt with non-default

As an example, where in this block of text did I enter the next command?

![hard to find the prompt, eh?](/images/17-05-29-prompt_2.jpg)

Hint, it's sorta in the middle, where it says `bash-3.2$ curl josh.works`

Compare that to this version:

![easier to find the prompt now, methinks](/images/17-05-29-prompt_1.jpg)

(Oops, shouldn't be making changes on `master`...)

#### Configuration

To set this all up, carefully follow Michael Hartl's instructions on his [Learn Enough Git](https://www.learnenough.com/git-tutorial#sec-prompt_branches_and_tab_completion) tutorial. That will give you tab completion and the current branch in your prompt.

To change the color of your prompt, that's a bit more of a hassle.

Open up your `~/.bashrc`, and find the line that starts with `PS1`.

It should have somewhere inside of it the code you just added per Michael Hartl's tutorial. You need to update that line to the following:

`PS1='\[\e[0;32m\][\W$(__git_ps1 " (%s)")]$ \[\e[m\]'`

This just adds color codes (and color code escapes, and a bunch of other color-related formatting) to your "Prompt String 1". It's voodoo, and will suck away hours of your life if you let it.

I wrote about this topic in more detail here: [Gist on Prompt customization](https://gist.github.com/josh-works/7f2e6c82d22dca6e9fbc029c8b17703d)

### Pulling up previous commands

In iTerm, the up arrow cycles through previously entered commands.

Just as useful, though, is filtering through this list. Imagine you ran `rspec spec/features/sessions/guest_user_can_sign_up_spec.rb`, all the tests passed, so you did your `git add/commit/push` workflow, and maybe some other stuff.

Now you want to run that specific RSpec command again, but it might be many commands ago.

If you type `!rsp` and hit `enter`, iTerm will find the last command that starts with `rsp`, and place it under your cursor. If you want to run it, hit `enter`. I use this _all the time_.

(There's more complex "interactive search" tools you can use, but the `!command` is a great starting point.)

### Navigate iTerm output quickly

Since the up arrow pulls up previous commands, to scroll back through your iTerm output one line at a time, hold down `shift` and hit `up arrow`.

To scroll one page at a time, hold down `shift + command` and hit `up arrow`.

To get back to the bottom, let go of `shift/command` and hit the up or down arrow.

### Global key binding

We use alt-tab all day long, but it's imprecise. The order of the items that you cycle through with alt-tab depends on what you last used.

I like being able to jump to important programs straight away.

In `preferences > keys > hotkey` you can set a "system-wide hotkey". I've got mine mapped to `cmd+shift+i` (`i` for "iTerm"), and it doesn't conflict with any other bindings on my machine. I use it dozens of times a day.

<img src="/images/17-05-30-iterm_1.jpg" alt="Keyboard Settings" style="width: 400px; margin: 0 auto; display: block;">

### Reuse current working directory for new tabs/panes

Split panes are cool, but it's a huge pain if it always opens a new tab to your root directory. You have to `cd` around just to get to where you want to be.

The fix is easy. Set iTerm to use your "Present Working Directory" for new panes. When I'm pairing with other students, this is one of the first changes I recommend they make.

<img src="/images/17-05-30-iterm_2.jpg" alt="Keyboard Settings" style="width: 400px; margin: 0 auto; display: block;">

### Misc
- [Regis' iTerm tutorial (YouTube)](https://www.youtube.com/watch?v=d3gujjfzAfw&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=3)

# Atom

I spend quite a bit of time in Atom every day. It's a big piece to bite off, so I'm not going to go into too much depth, and will let others do most of the talking.

First, check out [Regis' Atom/Spectacle shortcuts video](https://www.youtube.com/watch?v=uulWZVXOuxs&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=1)

Next, a few packages I like:

- [Advanced-open-file](https://atom.io/packages/advanced-open-file): Create new directories/files inside of Atom. No need to jump to your terminal.
- [indent-guide-improved](https://atom.io/packages/indent-guide-improved)
- [minimap](https://atom.io/packages/minimap)
- [multi-cursor](https://atom.io/packages/multi-cursor)


### Splitting Screens for fun and profit

- [Split screens/panes and move between them](http://flight-manual.atom.io/using-atom/sections/panes/)
- [Atom getting started guide](https://readwrite.com/2014/05/20/github-atom-5-tips-getting-started-tutorial-corey-johnson/)
- [Regis' Atom/Spectacle shortcuts video](https://www.youtube.com/watch?v=uulWZVXOuxs&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=1)


### New lines where you want them

`cmd-enter` makes a new line under your cursor, and places your cursor there. `cmd-shift-enter` makes a new line above your cursor, also places your cursor there.

### Find all the things

Have you ever had a spelling error, but you're not sure where in your project it is?

You're familiar with `cmd-f`, or "find within document". You should also use the related `cmd-shift-f`, or "find within project". Atom will search your entire project (everything that is in the sidebar) for whatever criteria you give it.

If you misspelled a method somewhere and don't recall where, use global find to get find it.

It's got many, many uses. You'll find them all.

# Git/Github

Oh boy. Git. It's the most amazing thing ever, but it can be intimidating.

![Magical incantations](https://imgs.xkcd.com/comics/git.png))

[Even professional developers are not completely at home with git](link to study about github workflow on professional dev teams)(Still trying to find this study...)

This is good news! This means as intimidating is Git may seem, we're in good company. Any effort expended on better understanding Git will be well-spent.

Many others have written about Git and how to use it far better than I ever could, so I'll make just a few suggestions.

### Use a staging branch for group work

If you've got a group project and you need the `master` branch to always be stable (because Heroku is always running on it, or something) change the repo settings to make a branch besides master the default branch.

Just make `staging` the default branch for your repo, and now all your PRs will (by default) be against this branch. This is perfect, because you might find yourself often squashing bugs when merging in other's work, and it's way better to hotfix bugs on something that is not `master`.

### Always merge `staging` into your branch before making a pull request

In group work, especially if you have a branch checked out for more than a few hours (or a day), it's possible that the "base branch" will change between when you check out your branch, and when you want to merge it back in.

It will be a great service to your team if, before making your pull request for your new feature, to fetch and merge the most recent version of staging, and then merge staging into your branch.

THEN make your pull request. If you do this every time you make a PR, you should pretty much never have merge conflicts, and then you and the team don't have to try to sort all that out when merging.

Then, whenever `staging` is in good shape, and you want to update `master`, just merge `staging` to `master`, and you're good to go!

# Chrome

You'll spend a lot of time in your browser.

There's some keyboard shortcuts I use all the time for Chrome. Don't try to use all at once, but test each one once or twice, decide if you like it, and then use it for a few days.

## Shortcuts for Chrome

- `cmd-l` puts the "focus" on the address bar. You can copy the address, paste a different one in, etc.
- `cmd-shift-[` and `cmd-shift-]` cycles left and right through your current tabs. (This tab movement works in Atom too!)
- `cmd-shift-c` opens your "element selector" in your dev tools.
- the above shortcut pairs well with `cmd-opt-i`, which toggles your dev tools. I often hit the element selector shortcut, click the item I want to inspect, and then toggle dev tools closed again, all in a second or two.
- `cmd-w` closes the current tab.

## Extensions

- [The Great Suspender](https://chrome.google.com/webstore/detail/the-great-suspender/klbibkeccnjlkjkiokjodocebajanakg?hl=en) will "put to sleep" inactive tabs. Chrome is a bit of a resource hog, and this seems to help it consume less energy.
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en) gets you Vim-like navigation around your browser. I use it mostly to move up/down a page and to "click" links with the keyboard, but it can do much more than that.
- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en) is an Ad-blocker, closely related to (but very much distinct) [uBlock](https://www.reddit.com/r/ublock/comments/32mos6/ublock_vs_ublock_origin/). I love it. Cuts down on the visual clutter that tends to crop up on pages, and has some other cool tools. (Similar to Chrome's "element selector", you can click an element with uBlock and add it to a black-list, so you'll never see that pop-up/interstitial again)

# Applications

### Dash: Documentation that doesn't suck

[Dash](https://kapeli.com/dash) is an application that lets you download documentation for just about anything with documentation. I regularly use docs for Ruby, Rails, HTML, CSS, Sass, JavaScript, and more. With Dash, I don't have to hop into a browser and google for things, because it's already installed locally, and is searchable.

It's not free, but I find it worth it. (It has a free-to-use mode that makes you wait a short period of time before using it.)

### Alfred: Do anything on your computer

[AlfredApp](https://www.alfredapp.com/) is my favorite program on my computer, by miles. It replaces your "omnibar", or whatever pops up when you hit `cmd-space`. Alfred's workflows are where the real power shows.

I can't give it a fraction of the praise it deserves, so here's some "getting started with Alfred" guides that might convince you to give it a whirl.

The powerpack extension is not free, but the base application is free. It's a big step up from the default mac omnisearch thing.

- [Beginners guide to Alfred](https://www.alfredapp.com/blog/tips-and-tricks/beginners-guide-to-alfred-searching-your-mac-and-the-web/)
- [Lifehacker: Beginners guide to Alfred](http://lifehacker.com/a-beginners-guide-to-mouseless-computing-with-alfred-1596198655)
- [Some Starter Workflows](https://www.maketecheasier.com/alfred-workflows-mac/)

### Flux: Save your eyes

[Flux]() is a neat little utility that increases the "warmth" of your laptop screen at night. It will save you a bunch of eye strain.

### Browsing securely with PIA

Do you use coffee shop wifi? If so, especially once you're working on someone else's product, you should consider using a Virtual Private Network.

It secures your traffic from snooping, even from others who are using the network, and the network provider itself. I've been using [PIA]() for two years (it's ~$30/year) and am quite happy with it.

### Links
- [Regis' Atom/Spectacle shortcuts (YouTube)](https://www.youtube.com/watch?v=uulWZVXOuxs&list=PLwJTr6-X6O0SX5YOVZx_c7GkZPOM-eTwN&index=1)
