---
layout: post
title:  "My terminal setup"
description: "My basic terminal setup. This is a draft post, very much WIP."
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [bash, zsh, terminal-setup]
permalink: terminal-setup
image: /images/title_image.jpg
---

_note: this is a draft. Please ping me in slack/email with questions, spots where this is unclear. I'll answer your question, and update this post._

Here's some quick notes on how I have my terminal setup. 

First, I use Zsh. If you're on a new Macbook Pro, you also are using Zsh. 


## Install iTerm

If you're using `Terminal.app`, head to [https://iterm2.com/index.html](https://iterm2.com/index.html) and click the "download" button. Install the app. 

## Install `oh my zsh`

Install `oh my zsh`:

Head to [https://ohmyz.sh/](https://ohmyz.sh/) and follow their installation instructions, which is

> Run the following command in your terminal:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Edit ~/.zshrc`

Open up `~/.zshrc` in Atom. We'll use it a few times.

Line 10 or 11, change the `theme` value to `agnoster`

[github.com/agnoster/agnoster-zsh-theme](github.com/agnoster/agnoster-zsh-theme)

Head to the repo and follow the installation instructions, which touch on:

### Install the Patched Solarized Fonts:

[github.com/powerline/fonts](github.com/powerline/fonts)

```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

### Update iTerm to use one of the new fonts

`Profiles > Text > Font (Meslo LG M DZ for Powerline)`

![iterm settings](/images_2020/2020-08-12 at 1.56 PM.jpg)

open up this file: `~/.oh-my-zsh/themes/agnoster.zsh-theme`

or do `atom ~/.oh-my-zsh`

Atom open up the themes directory, and open up `agnoster.zsh-theme`

comment out the existing line that says `PROMPT` on line 230, and paste in:

```
PROMPT='$(build_prompt) 
> '
```

Should look like this:

![prompt](/images_2020/2020-08-12 at 1.50 PM.jpg)

### Resources

- [Josh's Zsh Setup instructions from ages ago](https://gist.github.com/josh-works/22b3cd2f4cc4abc9458f50c4b47565e2)
- [Jazz Up Your “ZSH” Terminal In Seven Steps — A Visual Guide](https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/)
- [How to install and use iterm and oh-my-zsh](https://duskcloudxu.github.io/2020/03/04/How-to-install-and-use-iterm-and-oh-my-zsh/)