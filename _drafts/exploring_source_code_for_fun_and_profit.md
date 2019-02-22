---
layout: post
title:  "Pry-ing into a Stack Trace"
date:  2019-02-22 05:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [rails, programming]
permalink: prying-into-a-stack-trace
---

I was recently working on a feature, committed what I thought was clean code, and started getting errors. I `git stash`ed, and re-ran my tests, and still got errors. Here's the full stacktrace:

```
> b ruby -Itest test/models/model_name_redacted_test.rb

# Running tests with run options -n=/errors/ --seed 55842:

/Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-reporters-1.3.5/lib/minitest/reporters/default_reporter.rb:49:in `after_suite': undefined method `name' for nil:NilClass (NoMethodError)
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-reporters-1.3.5/lib/minitest/reporters/base_reporter.rb:59:in `report'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-reporters-1.3.5/lib/minitest/reporters/default_reporter.rb:89:in `report'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-reporters-1.3.5/lib/minitest/minitest_reporter_plugin.rb:26:in `each'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-reporters-1.3.5/lib/minitest/minitest_reporter_plugin.rb:26:in `report'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-5.11.3/lib/minitest.rb:808:in `each'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-5.11.3/lib/minitest.rb:808:in `report'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-5.11.3/lib/minitest.rb:141:in `run'
	from /Users/joshthompson/.rvm/gems/ruby-2.3.7/gems/minitest-5.11.3/lib/minitest.rb:63:in `block in autorun'
Coverage report generated for Unit Tests to /Users/joshthompson/wombat/threatsim-rails/threatsim/coverage. 1512 / 17964 LOC (8.42%) covered.
```

This is a relatively common error. Something is `nil` where it ought not to be `nil`. 

But now for the kicker. 

I found out you can _hold the cmd key down and click one of those file paths_!!!

AND YOU CAN JUST PUT A PRY IN THERE SOMEWHERE AND YOU'LL HIT IT NEXT TIME THAT LINE OF CODE EXECUTES!!!
<!--more-->

AAAAAHHHHH HOW DID I NOT KNOW THIS??? I've been writing code full-time for two years, and did not know I could do this!

OK, I am breathing fine. Shall we unpack this?

Lets run the test. It'll cause an error, with a stack trace. Hold down the `cmd` key, and mouse over the path, as you would a URL:

![cmd and mouseover](/images/2019-02-21 at 11.45 PM.png)

Great. Now click it. 

The file you selected gets opened up in your current text editor, with the cursor at the line in question!

![file opens](/images/2019-02-21 at 11.47 PM.png)

You can stick a `pry` in there to pause execution and poke around.

![pry ready to go](/images/2019-02-21 at 11.50 PM.png)

Run the test again, and execution pauses at the pry. (In this case, the `super` keyword bumps where the pry hits to the superclass.)

![exploring the context](/images/2019-02-21 at 11.52 PM.png)

The long story short is - I was passing a `name` flag to Minitest, and it couldn't find a test by that name. 

I wouldn't have figured this out except for exploring the source code - I would have kept rolling back my commits, thinking that I'd botched my code somewhere.

Being able to quickly explore the source code of Ruby gems **and interact with those gems in a pry sessions** is a complete game changer. 

Here's what the `all_reporters` object looked like, by the way:

![all reporters](/images/2019-02-21 at 11.54 PM.png)

This is huge. I'm so excited about this. 