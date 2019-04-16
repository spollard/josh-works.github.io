---
layout: post
title:  "How I (Josh) do Pull Requests (and Reviews)"
date:  2019-04-16 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, git]
permalink: how-josh-does-pull-request-and-reviews
---

A pull request, or "PR", is the culmination of the dominant output of your job as a developer. Of course you do a lot more than just write code, but at the end of the day, writing code is what you're hired to do.

You load the problem space into your head, you get the feature built, you <strike>start with</strike>, <strike>regularly drive your decisions with</strike>, sometimes rely on tests, but usually make sure to add some right before making the PR and more. 

> Josh, you lost me. What the heck is a pull request?

Great question! [Here's a few overview on Quora](https://www.quora.com/GitHub-What-is-a-pull-request)

So, if a pull request is the visible manifestation of the work you do as a developer, what happens once you make the PR? And, just as importantly, what do you do when others on your team make _their_ pull requests?

What sort of opportunities and common pitfalls might lie ahead? 

I'll outline below a little of my process (some of it is stuff I do every day, some of it is aspirational and depends on the day), and I hope to slowly improve how I make PRs, and how I review them. 

## Opportunities and Pitfalls

We require two approvals before the branch can be merged, and 

I'm on a team of five, and the person who puts up a PR isn't eligible to review their own PR, so... for every PR, of the three others on the team, two of them need to approve it in order for the branch to be merged. 

I don't want to just be rubber-stamping pull requests, but I also don't want to slow the whole process down because I don't necessarily have all the context that the origional developer has when the built or modified the feature. 

My team helps me so much, the least I can do is try to do useful reviews on their features. It's hard, though. 

What follows is what I've learned, mixed in with a little process, to try to deliver useful feedback on PRs. 

# Find the reviews

First, we request each other's reviews. We have a PR Notification channel, but it gets cluttered, so the "source of truth" for PRs we need to review is usually Github's list of review requests: https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+sort%3Aupdated-desc+review-requested%3A<your_username_here>

Or, navigate to it at https://github.com/pulls:

![review requested](https://cl.ly/d91d89d7fa6d/2018-10-02%20at%201.51%20PM.jpg)

<!--more-->

# Big PR or little one?

Big pull requests and little ones have different work-flows. 

## A Small PR

### Get the context

I always start with opening the Jira ticket associated with the PR. (We [automatically link Jira tickets with branches and such](https://confluence.atlassian.com/adminjiracloud/connect-jira-cloud-to-github-814188429.html))

I'll open it up, read the ticket, and try to load some of the general context of the PR.

Next, I'll read the description and any notes provided in the PR. I (sometimes to the chagrin of my team) sometimes _exhaustively_ document everything I do. So, I appreciate it when others do the same. Of course, most people don't write small books for one-liners, so I don't always get this. :)

### Review the code

If it's a little PR, I just look at the code in the Github UI, showing the diffs.

If there's something that doesn't make sense to me, I'll ask a question. Like:

> Why did you use {this method} here? I don't fully understand the context around that
or 
> This small bug fix has/does not have a new test. Can you explain your reasoning there?

Since I'm the least experienced, my default assumption is 

> There's a good reason you're doing it this way. I just don't know it yet. I want to know your reasoning, so I can make similarly informed decisions down the road for myself. 

Asking questions on PRs is a great way to gain some of that context and understanding. 

If all I've got is questions, I'll leave the questions and approve the PR. I don't want them to feel held up just because I don't understand something they did.


# Big Pull Requests

Sometimes we put in "big" pull requests. I don't know how exactly to define a large PR, but... anything that has a few hundred lines of code changed, or touches many different files. Usually these "big" PRs are actually a lot of small, identical changes, like updating the name of a class everywhere it's used (rare) or changing syntax for some ActiveRecord call across the entire repository as part of a Rails upgrade (more common).

There's a few strategies here. 

First, if the PR has specific requests for things to focus on, I'll do that. If it's just a big PR tossed up for our edification, I'll look for easy-to-spot but common errors. (I, personally, love to leave `_xx` at the end of certain tests. :blush:

There's a few strategies:

## Check out the code itself on your own machine

So just `git fetch & git checkout origin/their_branch_name`, `rake db:migrate`, etc. 

> Just run the tests, Josh

This has, _so far_ not led to much success. Simply because our entire test harness on our largest app 

1) takes up to fifteen minutes to run locally
2) Throws errors for annoying reasons that are not actually related (necessarily) to the new features being built. #technicaldebt
3) We don't push PRs with failing tests (if there are _known_ failures, it's by definition a "work in progress" commit, and all the rules change anyway.)


# Things I keep in mind

### 1. Code reviews _are my job_. 

I'm not doing some less-important thing than bug fixing or feature development when I'm doing a code review. 

### 2. Code reviews are _crucial_ to improving my own skills

### 3. Code reviews are crucial to improving other's skills

- Eventually, code reviews will be a large portion of how I'll help less-experienced developers become experienced developers. I can't wait until then to magically start caring a lot about code reviews. 

### 4. Code reviews can be celebrations

Code reviews are how I can encourage my team, and thank them for their knowledge, their hard work, their tenacity and their creative solutions. 

I know sometimes I have struggled through some bug fix for what feels like eternity, and i'm always super excited to put the PR up. I'm thrilled to get the feedback from the rest of the team. Usually it's a mix of "good job!" and "good job! Here's a thing to think about", or I'll get requested changes, etc. 




### Resources

- [On Empathy & Pull Requests (Slack)](https://slack.engineering/on-empathy-pull-requests-979e4257d158?gi=af9d89d6edcf)
- [How About Code Reviews? (Slack)](https://slack.engineering/how-about-code-reviews-2695fb10d034)
