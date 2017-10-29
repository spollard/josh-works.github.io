---
layout: post
title:  "Elixir/Phoenix part deux"
date:   2017-10-28 01:18:52 -0600
crosspost_to_medium: false
categories: [programming, elixir]
tags: [elixir, programming, phoenix]
permalink: elixir-phoenix-part-deux
---

I planned on working through [this](https://medium.com/@benhansen/lets-build-a-slack-clone-with-elixir-phoenix-and-react-part-1-project-setup-3252ae780a1) tutorial for building a slack clone, but half-way through the set-up instructions, after I installed Elixir and Phoenix, I [took a long detour](_posts/2017-10-27-intro_elixir.md) through the basic set-up guide. Built some custom routes, along with controllers/views/templates, etc.

I'm now a bit more comfortable with the basics of the framework and language, so I'll now be working through the tutorial, and [Rubber Duck Debugging](https://www.wikiwand.com/en/Rubber_duck_debugging) by writing about it as I go.

_This will be a bit of a work-in-progress. Onward._

<!--more-->

OK. Basic setup done. Scaffolded the Phoenix and React app, made the [initial commit](https://github.com/josh-works/sling_clone), and we're cooking with gas.

The setup is pretty straight forward - a quick note on the _React/Redux Boilerplate_ section: I've had only passing experience with React/Redux, so I might take a detour through some resources for those tools sometime during this tutorial.

I don't find much value in blindly following guides without having a good idea of what's going on. This desire is tempered by me knowing that I cannot absorb everything my first pass, and things will become clear on my third and fourth exposure to a topic that I simply cannot pick up my first or second.

OK, down to the bottom of the first tutorial section, and the React App is not working as expected. [Here's where I'm at right now](https://github.com/josh-works/sling_clone/commit/43084b18f7fb8050c313bf857dc19f65f6ea3d68), and while it's compiling successfully, I've got lots of errors:

```
Broadcast.js:104 Uncaught TypeError: Cannot read property 'object' of undefined
    at Object../node_modules/react-broadcast/Broadcast.js (Broadcast.js:104)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../node_modules/react-broadcast/index.js (index.js:6)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../node_modules/react-router/Broadcasts.js (Broadcasts.js:12)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../node_modules/react-router/Link.js (Link.js:13)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../node_modules/react-router/index.js (index.js:6)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../src/containers/App/index.js (index.js:11)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object../src/index.js (index.js:7)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at fn (bootstrap 4fb1954d0e8840de1bbc:87)
    at Object.0 (index.js:11)
    at __webpack_require__ (bootstrap 4fb1954d0e8840de1bbc:669)
    at bootstrap 4fb1954d0e8840de1bbc:715
    at bundle.js:719
```

As I mentioned earlier, I don't have tons of React experience, so I'm going to go take a quick dive into the world of React. I expect, on the other end, to have a better framework for debugging and understanding the design decisions the tutorial author is making.

I think part of the challenge is this guide was written in January 2017, or approaching a year ago. React changes quickly, and in Ruby/Rails, I've always been able to fill in the info gaps when debugging problems, but React (and Elixir) I'm not yet there.

-----------------

[Quick pass through React]({{ site.baseurl }}{% link _posts/2017-10-29-quick-dive-into-react.md %})
