---
layout: post
title:  "Growing in your first software development job"
date:  2018-11-28 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [software development, growth, career]
permalink: growing-in-first-software-development-job
---

I started my first software developer role a year ago. (November 2017)

This is tremendously exciting, of course, but introduces its own set of challenges, like:

> I finished Turing and I've got a job! Oh snap. I just finished a grueling program, and my reward is I'm fit to sit at the same table with people who _know so much more than me_.

> I have to learn a whole new codebase. Or four.

> I have to meet the standards of an inexperienced-but-competent professional, which are higher than "eager student".

So, I've been thinking _a lot_ about to grow as a developer in my job.

## What does "grow as a developer" mean?

Part of growing in anything means having goals. I have career goals that may be 5+ years out, but for the next year or two, these are the goals I'm using to drive me towards my goal of being "an experienced developer""

- Build _deep_ competency with the "standard" Rails framework. I think Rails scales just fine, and I don't want to toss a JS-heavy front-end on our application. (I'm ~~secretly~~ pulling for Turbolinks and Stimulus...)
- Help guide our product through a few big changes in the coming year, _and help drive decisions around those changes_
- Support other teams within the company
- Put up a lot of PRs, close a lot of tickets. Do a lot of "work"
- ??? 

These are not great goals, as far as good goal-setting goes, but I am not worrying too much about it, because good habits tend to be more important than good goals. And I've got good habits!

## Constraints

Here are some constraints I'm operating within:

- I work on a 100% distributed team of developers, but most of the rest of the offices works in-office in Pittsburgh. (Project/Product Management, Quality Assurance, DevOps, Support, Managed Services, Sales)
- My immediate team is a group of three other developers. Myself and one other dev started at the same time.
- The other two developers have been on the team for about three years.
- The individuals who built most of the application is no longer on the team.
- there is an extreme level of trust passed to all on the team. No one is required to pair with me, or checks in with me every day to make sure I've committed X code or fixed Y bugs.
- We're currently without an immediate manager. 
- I live a balanced life. I spend time with my wife, I rock climb a lot, I've gotten back into running, I read a lot. I won't spend 20 hours a week on top of my job, trying to become a better developer. 

<!--more-->

These constraints are challenges, indeed. In some ways, it might be easier to waltz into a company that has a robust mentoring program, and batch-hires new developers so everyone is passing through the mentorship pipeline with a buddy.

Sure, that would be cool. But then I'd miss out on all the fun of wrestling with this challenge myself. I've rarely found myself in the exact same place, moving in the exact same speed, as many others, so this is a very Josh-friendly opportunity. 

## What is the range of options available to me?

There's a few potential avenues I'm exploring right now:

- Pairing more with my coworkers
- self-study
- implement suggestions from other developers
- Work-related side-projects
- non-work-related side-projects
- Meetups
- Teaching/helping others


### Pairing more with coworkers

A simplistic solution could be to go look at some company who has an established mentorship program, and try to force-fit it into our team of four. If said plan called for 15 hours a week of pairing, I could ask each of the three developers how they felt about pairing with me for five hours a week, each.

That's almost a workday out of each week that would be lost to pairing. Maybe this is the most effective use of everyone's time, but I'm not yet convinced that it is. 

If it _is_ the best use of time, there's still a lot of questions about how it would work, like:

- how should we pair? 
- Driver/Navigator? One types, the other adds insights and suggestions?
- Do we use my machine or theirs?
- Do we work on whatever ticket I'm working on? Whatever ticket they're working on? both? neither?

We're also 100% remote, so this pairing would have to be 100% Slack/Zoom/something similar. Anytime the internet dropped many packets, there would be lag and friction.

Since I've started, I have set up weekly 1:1s with everyone on my team. Usually technical things come up, and I get help with whatever I'm working on, but a big part of it was I wanted to get to know my team. We don't see each other often, and I wanted to get to know them. I also sometimes "shadow" one of my coworkers for 30 minutes or an hour a week, to absorb some of how they work, without interrupting their work too much. 

### Self-study

There's a lot of great books out there about software development, and classes, videos, and more. 

So far, I've read (or am reading)

- [Metaprogramming in Ruby](https://pragprog.com/book/ppmetr2/metaprogramming-ruby-2)
- [Practical Object-Oriented Design in Ruby](https://www.poodr.com/)
- [The Pragmatic Programmer](https://www.amazon.com/Pragmatic-Programmer-Journeyman-Master/dp/020161622X)
- [The Nature of Software Development (Ron Jeffries)](https://pragprog.com/book/cfcar2/the-passionate-programmer)
- [Agile Web Development with Rails 5](https://www.goodreads.com/book/show/29902035-agile-web-development-with-rails-5?ac=1&from_search=true)
- [Eloquent Ruby](https://www.goodreads.com/book/show/9364729-eloquent-ruby?ac=1&from_search=true#)
- [SQL Queries for Mere Mortals](https://www.amazon.com/SQL-Queries-Mere-Mortals-Hands/dp/0321992474)

That' a start, but only that - a start. I don't yet feel like I've read that many books about software development, Ruby/Rails, or programming in general. So, since I love to read, I'll always have a book or two going on the topic.

### Courses

I done most of Avdi Grimm's [Mastering the Object Oriented Mindset](https://avdi.codes/moom/)

It's been good so far. I'm learning plenty, and I'm about half-way through it, and have been [writing about some of what I've learned](https://josh.works/tags#moom)

I've also started Nate Berkopec's [RailsSpeed course](https://www.railsspeed.com/) - it's all about speeding up a Rails app, and I'm really excited about it. 

Both of these have given me a lot of value. In different ways, but I'm feeling like a wiser, more confident, more competent developer because of it. 

So far, though, I've not been able to take something directly from one of these courses and apply it at Wombat. I'm not concerned about that at all - I've not finished either course, and I'll have plenty of opportunity to apply this learning. 

### Work-related side-projects

As I encounter projects at work that are amenable to studying in more depth, and spinning into a one-off tutorial/blog post, I will capture the idea and consider a few hours of effort in that direction. 

That is where a few recent blog posts have been born:

- [Pry Tips and Tricks]({{ site.baseurl }}{% link _posts/2018-05-07-pry_tips_tricks.md %})
- [Sidekiq/Redis/Background jobs]({{ site.baseurl }}{% link _posts/2018-07-30-sidekiq_background_jobs_for_beginners.md %})
- [array intersection/divergence]({{ site.baseurl }}{% link _posts/2018-02-02-array_divergence.md %})
- [Testing Rake Tasks]({{ site.baseurl }}{% link _posts/2018-02-08-test_rake_tasks_rails.md %})

These blog posts are a great way for me to build a more robust mental model around the topic, as well as give me something to refer back to if I need to later.

This is a nice "proof of progress", as well. It's easy for me to feel like I've not made much progress in the last week, and therefore _I must have made no progress in the last six months_. This is a logical fallacy, but that's how my brain works. It's nice to have evidence of work done.

### non-work-related side-projects

I don't spend too much time on non-work related projects. I'd love to extend my Turing capstone project, [Block Value]({{ site.baseurl }}{% link _posts/2017-09-14-block_value_app.md %} ). 

I had a ton of fun with it, and it feels close to being _actually good_. I'd need to brush up on my Javascript a bit, though. When I'm ready to dig into Javascript, I think this project might be the way I do that. I'd like to drop in OpenStreetMaps instead of Google Maps, and drop in [Leaflet.js](https://leafletjs.com/) instead of the crappy Javascript I have in there. 

### Meetups

I've been attending [Boulder.rb](https://www.meetup.com/boulder_ruby_group/) and [Denver.rb](https://www.meetup.com/Denver-rb/) (and am considering starting a meetup in Golden!), and I've enjoyed those communities. Both are fairly time consuming, as I have to travel to the location mid-day to dodge rush hour, etc. 

I'm giving a talk at Boulder.rb in a few weeks, and hope to keep that trend rolling.  

### Teaching/helping others

I like helping others. In job hunts, salary negotiations, learning programming, rock climbing, and more. 

I've worked regularly with folks breaking into software development (Turing and non-Turing students) and I enjoy the process. It helps me stretch my empathy/teaching/understanding muscles, and I very much enjoy teaching, and seeing others make progress, so this is probably something I'll continue for the rest of my career. 

I know that helping others is a part of growing in a career, but I'm not yet seeing where this interest of mine ties into helping my own skills grow. 

As our team at Wombat grows, I'll get to step into a bit of a mentorship role there, but this opportunity brings this post full circle. I'm not yet exactly sure what I have to offer. Sure, I'll be useful in them getting their environment set up, and wrapping their head around the code base, and making good PRs and stuff... but I've got a lot more I need to learn. 

### Additional Resources

I've read all of this, and more, in pursuit of upping my skills.

- [How to Break Through Any Learning Plateau and Never Stop Growing (Nat Ellison)](https://www.nateliason.com/blog/learning-plateau)
- [New Research Shows "Heavy Learners"​ More Confident, Successful, and Happy at Work (LinkedIn)](https://www.linkedin.com/pulse/want-happy-work-spend-time-learning-josh-bersin/)
- [How Slack Supports Junior Engineers (Slack)](https://slack.engineering/how-slack-supports-junior-engineers-89f6dcfe74a1)
- [How Your Company Can Support Junior Engineers](https://www.eventbrite.com/engineering/how-to-support-junior-engineers/)
- [What's a senior engineer's job? (Julia Evans)](https://jvns.ca/blog/senior-engineer/)
- [On Being A Senior Engineer (John Allspaw)](https://www.kitchensoap.com/2012/10/25/on-being-a-senior-engineer/)
- [Career narratives. (Will Larson)](https://lethain.com/career-narratives/)
- [Ask HN: What is your best advice for a junior software developer?](https://news.ycombinator.com/item?id=18128477&p=2)
