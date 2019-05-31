---
layout: post
title:  "Receiving Email in A Rails App with Mailgun and Griddler"
date: 2019-05-31 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, rails]
permalink: receiving-email-in-a-rails-app
---


### Viewing Gem Source Code

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