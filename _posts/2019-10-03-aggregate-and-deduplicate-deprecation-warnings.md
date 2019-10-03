---
layout: post
title:  "Aggregate and deduplicate your deprecation warnings in Rails"
description: "use `tail`, `grep`, `sort` and `uniq` to find all your deprecation warnings in your app"
date:  2019-10-03 06:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [deprecation_warnings, rails_upgrades, programming]
permalink: aggregate-and-deduplicate-rails-deprecation-warnings
image: /images/2019-10-03-deprecation-warnings-header.jpg
---

We know we all stay on the cutting edge of Rails; no one, and I mean _no one_ out there is making a `4.2 -> 5.2` upgrade because Rails 4.2 is no longer supported. 

You, dear reader, have just suddenly found an interest in resolving deprecation warnings, and as one jumps a few Rails versions in short order, finding and resolving them systematically will save you a lot of time.

Sure, you could run `tail -f log/test.log | grep "DEPRECATION WARNING"`, but that's not systematic. If the same line of code gets called 50 times, and prints a deprecation warning each time, that generates a lot of noise, not much signal.

This does no one any good:

![endless repeat warnings](/images/2019-10-03-deprecation-warning-01.jpg)

<!--more-->
Here's what I settled on: 

1. In one terminal window, run `tail -f log/test.log | grep "DEPRECATION WARNING" >> deprecation_warnings.txt`
2. In another terminal window, run all your tests. `rails test` or whatever.


If you take a look at `deprecation_warnings.txt` after all your tests run, you'll see plenty of deprecation warnings. Maybe even a few hundred lines of them.

Daunting, eh?

Lets make that less daunting:

We're going to remove all duplicates from that list, so the final output will show _just_ the unique deprecation warnings.

Run:

```
sort deprecation_warnings.txt | uniq -c > unique_deprecation_warnings.txt
```

You have to `sort` the file and pipe it into `uniq`. The `-c` flag prints the number of occurrences of each line. This might help you figure out where to get started in resolving the dependencies.

Now, the contents of `unique_deprecation_warnings.txt` is one line per deprecation warning that popped up when running your tests (or, you could do this with `log/development.log` and exercising/running the app locally) and you can be a bit more systematic in resolving these deprecation warnings.

I originally got 300 lines of deprecation warnings; once I sorted and deduplicated that list, I was down to 18. Much more manageable! 

This is much more usable!

![This does us much good!](/images/2019-10-03-deprecation-warnings-02.jpg)

Since the deprecation warnings include the specific line of code that generates the warning, this list now functions as a checklist of what I need to resolve in the app.
