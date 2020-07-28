---
layout: post
title: Basic DNS Management for Developers
categories:
tags:
status: publish
type: post
published: true
permalink: 
---

The only thing I know about DNS management is that DNS stands for "Domain Name Service". 

I've bought domains, and always stumbled through setting up the DNS settings correctly to point traffic to a certain domain to the right github pages URL. 

So... I thought I had it up and working, until within about two months I ran into three separate issues on two domains:

1. I'd temporarily added a landing page from a 3rd party to be served at the root of one domain. When I was ready to turn that off, I couldn't figure out how to "unserve" the landing page.
2. My domain worked if you visited `example.co` but not `www.example.co`. 
3. Another domain I thought I had configured _exactly_ like the other _working_ domain I had, and it wasn't working. Just a `server not found` message.

Here's the cloudflare DNS panel I am looking at:

![dns panel. :scream:](/images/2020-07-25-dns-01.jpg)

I understand that these are core pieces of the internet I'm dealing with. I kinda know what the various bits are, but not enough to debug what the problem is, or enough to have an idea of where to start digging.

So, I dug around, ended up on DNSimple's answer to [What's a CNAME record?](https://support.dnsimple.com/articles/cname-record/) which left me more confused that before:


> **CNAME records** can be used to alias one name to another. CNAME stands for Canonical Name.
>
>A common example is when you have both `example.com` and `www.example.com` pointing to the same application and hosted by the same server. In this case, to avoid maintaining two different records, it’s common to create:
>
>- An `A` record for `example.com` pointing to the server IP address
>- A `CNAME` record for `www.example.com` pointing to `example.com`

My questions:

- what do you mean "alias" one name to another?
- What does "name" mean in this context?
- What happens if there's no CNAME record?
- How can I see other site's CNAME records? _can_ I see public CNAME records?
- "same application and hosted by the same server". In my mind this is always the case, is this ever not the case? How will I know if it's not the case for me?
- Is it bad to "maintain two different records"? it's subtly implied that it is. 
- How do you maintain a record in the first place? Water it every other day, and get it a few hours of sunlight a day?
- what is a "record", in the context of an `A` record? What's an `A` record, in the context of any kind of record?
- How do I determine confidently the server IP address? Are loadbalancers irrelevant? Can I `dig` a url and be sure that the IP address I see is listed as an `A` record somewhere?
- Why can I not visit IP addresses directly? `josh.works` resolves, but when I visit one of the IPs listed in the `A` record directly, I get a Cloudflare 1003 error. Please mix/match prior questions with pre-pending `http`, `https`, `www` to the ip address. 

Quite a few questions, and I'm only through the first 7% of the article. 

It should be obvious now that _I have no mental model of what is going on here_. 

And, critically, without a mental model of what's going on, I cannot act independently and intelligently inside of the Cloudflare DNS panel.

This has trickledown effects, as well. I use `domains.google.com` to buy most of my domains, and always have to fiddle with DNS settings there. Sometimes I "leave" a domain with Google, sometimes I point it elsewhere. Does it matter if I set up all these records on Google Domains vs. Cloudflare? Of course, but I'm not really sure why.

This preamble done now, here you go:

# an exhaustive guide to DNS records for developers who have not had to know about DNS records before

TL;DR: this was my problem:

![relatively small mistake?](/images/2020-07-25-dns-02.jpg)

### Resources I'd looked at and not found helpful because they didn't explain it in basic-enough terms

- [Troubleshooting custom domains and GitHub Pages](https://docs.github.com/en/github/working-with-github-pages/troubleshooting-custom-domains-and-github-pages)
- [Configuring a custom domain for your GitHub Pages site](https://docs.github.com/en/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site)
- [“GitHub Pages currently does not support IPv6” when using my domain registered at Google domains](https://webmasters.stackexchange.com/questions/117935/github-pages-currently-does-not-support-ipv6-when-using-my-domain-registered-a)