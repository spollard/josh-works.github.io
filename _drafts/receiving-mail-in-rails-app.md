---
layout: post
title:  "Receiving Email in A Rails App with Mailgun and Griddler"
date: 2019-05-31 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, rails]
permalink: receiving-email-in-a-rails-app
---

Proofpoint had a two-day "hack day" recently. My coworker [John](https://github.com/Jliv316) and I teamed up on a cool little feature. 

In our day-to-day, we work on a simulated phishing tool; it lets our customers send simulated phishing attacks to their employees, and then we gather and report data on things like:
- who opened the email
- who clicked the phishing link (or opened the attachment)
- who read the subsequent training page

and more. 

One strong benefit of using this tool is our customers can send their employees very realistic, very tricky phish, and educate them how to avoid falling for those tricky phish "in the wild". 

The more realistic the phish, the high-quality the training. 

So, we wanted to set up an email inbox that our customers could forward real-life phish to, and our staff could look through all the submitted phish, preview the email, and decide to convert the _real_ phish into a simulated phishing template available in our "phishing template library". 

Basically, if you got a really sneaky phish, you could forward it to `phishingideas@proofpoint.com`, and we could quickly decide if we wanted to make this phishing template available to all our customers. 

I'd heard this idea discussed before, always as a "nice-to-have", but the feature ticket never got written, and we never prioritized it. John and I work closely with the Director of Support, and others, and when digging into their pain-points, they also said this would be a nice feature. 

So, we decided to build it! 

We still have to set up some SMTP stuff in Mailgun, and do a few other bits of configuration, but the actual rails app is functioning as expected, and can receive mail passed along from Mailgun. 

I'm not writing about receiving mail in a Rails app, though - that'll be another post. But at one point, John and I got pretty bogged down with some unexpected errors. 

It wasn't until we started exploring the source code of the gem generating the errors that we found the problem. 

**Had we been quicker to jump into the gem source code, we would have found the problem much quicker.**

Recently I've been making it a habit to explore stack traces when I get them, and when they pop up in my terminal, [it's super easy to view the source of the problem]({{ site.baseurl }}{% link _posts/2019-02-22-prying_into_a_stack_trace.md %}). 

So, here's the error we were getting:

![griddler gem](/images/griddler_gem_01.jpg)

The stack trace was a normal-looking stack trace:

```
NoMethodError at /email_processor
=================================

> undefined method `[]' for nil:NilClass

app/models/email_processor.rb, line 9
-------------------------------------

ruby
    4       @email = email
    5     end
    6   
    7     def process
    8       new_template = {
>   9         from_name:  @email.from[:name],
   10         from_email: @email.from[:email],
   11         email_body: @email.raw_html, #todo SANITIZE HTML
   12         subject: @email.subject,
   13         account_id: 314
   14       }


App backtrace
-------------

 - app/models/email_processor.rb:9:in `process'

Full backtrace
--------------

 - app/models/email_processor.rb:9:in `process'
 - griddler (1.5.2) app/controllers/griddler/emails_controller.rb:23:in `process_email'
 - griddler (1.5.2) app/controllers/griddler/emails_controller.rb:6:in `block in create'
 - griddler (1.5.2) app/controllers/griddler/emails_controller.rb:5:in `create'
 - actionpack (4.2.11.1) lib/action_controller/metal/implicit_render.rb:4:in `send_action'
 - actionpack (4.2.11.1) lib/abstract_controller/base.rb:198:in `process_action'
 - actionpack (4.2.11.1) lib/action_controller/metal/rendering.rb:10:in `process_action'
 - actionpack (4.2.11.1) lib/abstract_controller/callbacks.rb:20:in `block in process_action'
```

Our code was causing the stack trace when we called `@email.from[:name]`. But I didn't know exactly what the problem was. We were using the `griddler-mailgun` gem ([docs](https://github.com/bradpauly/griddler-mailgun)), and it seemed like we were running everything right. 

We'd found watched a [really old video](https://vimeo.com/67520302), and copied exactly the submitted params the video discussed.

We followed the [ThoughtBot setup instructions](https://thoughtbot.com/blog/griddler-is-better-than-ever). 

We could _not_ figure out the problem. I finally thought we should explore the gem source code, but I didn't want to just click around github. After all, the exact line this thing broke on isn't super helpful: https://github.com/thoughtbot/griddler/blob/master/app/controllers/griddler/emails_controller.rb#L23.

I knew there was a way to quickly open up a gem. I couldn't remember what it was. 

### Viewing Gem Source Code

https://stackoverflow.com/questions/10453249/viewing-a-gems-source-code

[One of the answers](https://stackoverflow.com/a/29770875/3210178) worked perfectly for us:

> I usually open a gem by running this command from the console
```
EDITOR=<your editor> bundle open <name of gem>
```

Since I use Atom and I wanted to see the `gridder` gem, I ran:

```
$ EDITOR=atom bundle open griddler
```

Boom. I could see the code. I can even put a `pry` in it!

![I can find the problem!](/images/griddler_gem_02.jpg)

When I re-ran the `POST` request from Postman, with `rails s` running in my terminal:

![it's alliiiive](/images/griddler_gem_03.jpg)

I won't bore you with the details, but by investigating the state of the `email` object being passed to `processor_class.new`, we could see that `email` already was missing params. 

So, I kept digging. Where was the email getting processed? Where was this `params` object coming from?

![I can find the problem!](/images/griddler_gem_03.jpg)

This took us over to the `griddler-mailgun` gem (we use `Mailgun` in our app, so we set up the `griddler-mailgun` gem to talk between services.)

So, I got to open _another_ gem in the editor. :)

`EDITOR=atom bundle open griddler-mailgun`

Here's what we found:

![suspicious use of upper case keys](/images/griddler_gem_05.jpg)

It seems odd that these keys were capitalized. In ruby ,`:From` is not the same as `:from`. 

So, we updated our params that we were passing in from Postman, to capitalize a few keys:

```json
{
	"recipient": "josh@domain.com",
	"From": "Not Working Well <whywontyouwork@working.foo>",
	"To": "josh@domain.com",
	"subject": "SendGrid thoughtbot",
	"body-plain": "This is some text body",
	"body-html": "Supports <em>HTML</em> as well."
}
```

Notice the capitalized `From` and `To`. 

And it worked. Now we had the email in our application.

This cost us almost _three hours_ of frustration. Once we started digging into the gem itself, we were unblocked in thirty minutes. 

I'm going to make a PR against the `griddler` and `griddler-mailgun` repositories soon, with a note in the documentation on this convention; maybe everyone who uses these tools knows that the `From` key has to be capitalized, but we sure didn't. 

But the big learning for me was... how to quickly open a gem for further investigation. And you can even stick a `pry` in it to trace around execution! 

There's more than one way to get at this. You can use `gem open`, as [per the docs](https://guides.rubygems.org/command-reference/#gem-open). You can specify a gem version to open, as it's common to have more than one version of a gem installed on your machine. 

```
gem open whenever -e atom -v 0.9.7
```




### Gaps in Griddler's docs

```
{
    "recipient": "josh@domain.com",
    "From": "whywontyouwork@working.foo",
    "To": "josh@domain.com",
    "subject": "SendGrid thoughtbot",
    "body-plain": "This is some text body",
    "body-html": "Supports <em>HTML</em> as well."
}
```

/Users/joshthompson/.rvm/gems/ruby-2.4.4/gems/griddler-mailgun-1.0.3/lib/griddler/mailgun/adapter.rb#normalize_params

From Postman:

```
{
	"recipient": "josh@domain.com",
	"From": "Not Working Well <whywontyouwork@working.foo>",
	"To": "josh@domain.com",
	"subject": "SendGrid thoughtbot",
	"body-plain": "This is some text body",
	"body-html": "Supports <em>HTML</em> as well."
}
```

Notice capitalized `From` fields, `To`, etc. 




### Resources

- https://hackernoon.com/receiving-and-parsing-email-in-rails-5-c975c2766364
- https://thoughtbot.com/blog/griddler-is-better-than-ever
- https://github.com/thoughtbot/griddler
- https://catskull.svbtle.com/use-griddler-to-receive-emails-as-http-post-events-in-rails
- https://github.com/bradpauly/griddler-mailgun
- https://github.com/thoughtbot/griddler/issues/22
- https://guides.rubygems.org/command-reference/#gem-open