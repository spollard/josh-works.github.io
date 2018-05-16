---
layout: post
title:  "Keyboard Shortcut to Toggle Bookmarks Bar in Firefox"
date:  2018-02-15 06:00:00 -0700
crosspost_to_medium: false
categories: [programming tools]
tags: [firefox, programming]
permalink: firefox-toggle-bookmark-bar-keyboard-shortcut
---

A few weeks ago, after [Firefox Quantum](https://www.mozilla.org/en-US/firefox/) came out, I decided to give it a go.

Turns out, Firefox is great! It was a near-seamless transition, and Firefox has a much lower memory footprint, as well as features Chrome does not have, like [Tracking Protection](https://support.mozilla.org/en-US/kb/tracking-protection) and [Reader View](https://blog.mozilla.org/firefox/reader-view/)

But something was bothering me to no end. I could _not_ find a keyboard shortcut to toggle the visibility of the bookmarks toolbar.

I take a lot of screenshots throughout the day, and share them within my company. I don't really want my bookmarks bar taking up space in the screenshot, but I do sometimes need it to find actual bookmarks.

In Chrome, `Cmd-Shift-B` toggles the bookmarks bar visibility. In Firefox, that combo shows your history.

<!--more-->

The primary fix is to use the Mac _operating system_ to set an App-specific keyboard shortcut. This is bananas, and I've never done it before.

Here's how to do it:

Navigate to `System Preferences > Keyboard`. From the options on the top bar (Keyboard, Text, Shortcuts, etc) select `Shortcuts`.

In the left-hand sidebar, choose `App Shortcuts`.

![find the app shortcut screen](/images/2018-02-15_01.jpg)

Hit the `+` icon to add a new shortcut, and select `Firefox.app` from the list of applications.

Enter this string exactly where in the Menu Title box:

`View->Toolbars->Bookmarks Toolbar`

![add the shortcut](/images/2018-02-15_02.jpg)

I used `Cmd-Shift-Y` as my shortcut - it took a few attempts to find something that didn't conflict with existing OS/Firefox shortcuts.

(And yes, I tried to unmap `Cmd-Shift-B`, to free it up for this shortcut, and could not. If you figure out how, please let me know.)

## The result

![toggle away, friend](/images/2018-02-15_03.gif)

## Firefox's Gotcha

Sometimes the keyboard shortcut doesn't work. It seems like Firefox "forgets" what it's supposed to do.

If that happens, I'm able to set things back as they should be by toggling the bookmarks bar manually, once, and then the shortcut works again.

(This setting lives in `View > Toolbars > Bookmarks Toolbar`)

### Additional Reading/Useful resources

- [OSX Daily: How to Create Custom Keyboard Shortcuts in Mac OS](http://osxdaily.com/2017/08/08/create-custom-keyboard-shortcut-mac/)
- [Mozilla Support Forum: Is there a short/hotkey to show/hide bookmark toolbar?](https://support.mozilla.org/en-US/questions/865261)
