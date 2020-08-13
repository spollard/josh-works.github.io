---
layout: post
title: Terminal Setup
categories:
tags:
permalink: terminal-setup
---


Install iTerm

Install `oh my zsh`:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Open up `~/.zshrc` in Atom. We'll use it a few times.

Line 10 or 11, change the `theme` value to `agnoster`

github.com/agnoster/agnoster-zsh-theme

You'll have to install the Patched Solarized Fonts:

github.com/powerline/fonts

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

Update iTerm to use one of the new fonts:

![iterm settings](/images_2020/2020-08-12 at 1.56 PM.jpg)

open up this file: `~/.oh-my-zsh/themes/agnoster.zsh-theme`

or do `atom ~/.oh-my-zsh`

Atom open up the themes directory, and open up `agnoster.zsh-theme`

comment out the existing line that says PROMPT, and paste in:

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