---
layout: post
title:  "Turing Prep Chapter 4: Arrays, Hashes, and Nested Collections"
date:  2019-06-09 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-arrays-hashes-nested-collections
---



### Index of this series:
- [Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %})
- [Turing Prep Chapter 2: Your first passing tests!]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %}) 
- [Turing Prep Chapter 3: Video walk-through of a few of the mythical creatures, like `unicorn.rb`, `dragon.rb`, and `hobbit.rb`]({{ site.baseurl }}{% link _posts/2019-05-31-turing_prework_03_mythical_creatures.md%})
- [**Turing Prep Chapter 4: Arrays, Hashes, and Nested Collections**]({{ site.baseurl }}{% link _posts/2019-06-09-turing_prework_arrays_hashes_nested_collections.md %}) (This is what you're reading right now)
- [Turing Prep appendix: Troubleshooting Errors]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %})

So far, we've covered some string manipulation and did a few mythical creatures. 

You totally don't have to look through the screencasts in order. I just wanted to call out array/hash manipulation on its own page. 

[You can also look through the whole playlist](https://www.youtube.com/playlist?list=PLziI1EoC2-jdfrIdeqUNHYVTnq99uVm6I).

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/RUnd1Uu0AyE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<!--more-->


I'll add more screencasts for the other files in this directory soon:

```
$ tree collections
collections
├── README.md 
├── arrays.rb              // done
├── hashes.rb              // coming soon
└── nested_collections.rb  // coming soon
```

As I've mentioned before, I would recommend you try to stay _ahead_ of me in this video. If you get stuck on making a test pass for more than a few minutes, check that spot of the video, then carry on.

This video is so long because I go into excruciating detail on each test, not just showing the given method that works, but showing how I would google for the right answers if I didn't know them. 

Googling is a skill. Get good at it. :)

#### Here's an index of timestamps/what's covered at that location. 

- [1:10 - How to use this video](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=1m10s)
- [2:05 - test_0](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=2m05s)
- [2:28 - test_1](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=2m28s)
- [3:05 - test_2](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=3m05s)
- [3:35 - using "pry" for the first time in this file](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=3m35s)
- [4:53 - test_22](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=4m53s)
- [8:33 - test_3](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=8m33s)
- [9:20 - Anki flashcard post I mention]({{ site.baseurl }}{% link _posts/2017-06-06-memorizing-programming-with-anki.md %})
- [10:12 - test_4](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=10m12s)
- [14:10 - test_a](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=14m10s)
- [15:18 - test_5](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=15m18s)
- [18:17 - test_b](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=18m17s)
- [18:36 - test_c](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=18m36s)
- [19:08 - test_6](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=19m08s)
- [21:33 - test_7](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=21m33s)
- [23:02 - test_8](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=23m02s)
- [27:04 - test_9](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=27m04s)
- [30:19 - test_10](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=30m19s)
- [30:59 - test_11](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=30m59s)
- [31:41 - why read the docs?](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=31m41s)
- [32:37 - test_12](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=32m37s)
- [34:58 - test_13](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=34m58s)
- [36:05 - test_14](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=36m05s)
- [38:10 - suggested next steps](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=38m10s)
- [38:46 - write down Array methods in a notebook.](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=38m46s)
