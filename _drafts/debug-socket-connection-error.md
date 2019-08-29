---
layout: post
title:  "Ruby Version Scripting in Codeship"
description: "How to dynamically set the ruby version when running Codeship"
date:  2017-12-26 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [codeship, scripting, shell]
permalink: ruby-version-scripting-in-codeship
---

So, I just finished an upgrade from Rails 4.2 to 5.2 on one of our (small) Rails apps. Our primary/large Rails app will be a _lot_ more work, but this upgrade provided great insights. I've got a _ton_ of notes from the process that I'll reuse on the next upgrade.

All the tests passed locally, then I debugged [some codeship Ruby install problems]({{ site.baseurl }}{% link _drafts/codeship-tips-and-tricks.md %}), and then Codeship was happy.

So, I fired up our staging environment, sourcing this upgrade branch, and started exercising the new code.

And _immediately_ found problems. The whole app was (functionally) offline. Every single request we made to a resource managed by the app returned a `502`.

![502-status-dog](/images/2019-08-27-502-status-dog.jpg "https://httpstatusdogs.com/502-bad-gateway")

_from [HTTP Status Dogs](https://httpstatusdogs.com/502-bad-gateway)_

A `502` means:
> 502 Bad Gateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.

I dropped into our logs, and found an error like this, _everywhere_:

```
2019/08/27 17:01:13 [crit] 1054#0: *461 connect() to unix:/srv/rails/threatsim-lp/landingpages/tmp/sockets/puma.sock failed (2: No such file or directory) while connecting to upstream, 
client: 50.243.174.185, 
server: *.brewsec.com, 
request: "GET /af76c5e717?l=23 HTTP/1.1", 
upstream: "http://unix:/srv/rails/threatsim-lp/landingpages/tmp/sockets/puma.sock:/af76c5e717?l=23", 
host: "www.4531-landingpages-rails-5-2.brewsec.com"
```

(specifically, this happened a few dozen times, every time I tried to hit this particular resources.)

I'm not 100% sure that this is the _root_ of the problem, but a good start would be to rool this in/out as the problem. 

Step one:

# What the heck is a socket?

I remembered that Julia Evans made a [sockets/networking-related webzine](https://jvns.ca/networking-zine.pdf) a while back, so I _immediately_ headed over there.

# What the heck is `nginx` _doing_?

> Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache




### Resources
- []()
- [Julia Evans: Networking! Zine (PDF)](https://jvns.ca/networking-zine.pdf)
- [WebSocket (Wikipedia)](https://en.wikipedia.org/wiki/WebSocket)
- [rails nginx and puma error (StackOverflow)](https://stackoverflow.com/questions/37763318/rails-nginx-and-puma-error)
- [connect() to unix:/home/deploy/shared/tmp/sockets/puma.sock failed (2: No such file or directory)  (puma github issue)](https://github.com/puma/puma/issues/1353)
- [Puma, Nginx and rails5 not working (DigitalOcean)](https://www.digitalocean.com/community/questions/puma-nginx-and-rails5-not-working)
- [connect() to unix:/tmp/php-fpm.sock failed (2: No such file or directory) (StackOverflow)](https://stackoverflow.com/questions/35989291/connect-to-unix-tmp-php-fpm-sock-failed-2-no-such-file-or-directory)