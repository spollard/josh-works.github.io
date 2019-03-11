---
layout: post
title:  "HTTParty and to_json"
date:  2019-03-12 06:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [rails, programming]
permalink: httparty-and-to-json
---

I was having some trouble debugging an [HTTParty](https://github.com/jnunemaker/httparty) POST request. 

A few tools that were useful to me:

1. post DEBUG info to [`STDOUT`](https://www.computerhope.com/jargon/s/stdout.htm)
2. [`netcat`](https://www.poftut.com/netcat-nc-command-tutorial-examples/) to listen to HTTP requests locally

I had this code:

```ruby
options = {
  headers: {
    "Content-Type": "application/json",
    authorization: "Bearer #{our_token}",
  },
  query: { data: true },
  body: { token: their_token },
  debug_output: STDOUT
}
```
And when I `post`ed it: 

```ruby
HTTParty.post("#{BASE_URL}/endpoint", options)
```

I kept getting something like this:

```
opening connection to externalservice.net:443...
opened
starting SSL for externalservice.net:443...
SSL established
<- "POST /endpoint?data=true HTTP/1.1\r\nContent-Type: application/json\r\nAuthorization: Bearer alksdjflkajsdf\r\nHost: externalservice.net\r\nContent-Length: 1234\r\n\r\n"
<- "token=aslsdjfhasiudyfkajn"
-> "HTTP/1.1 400 Bad Request\r\n"
-> "Date: Mon, 11 Mar 2019 16:58:13 GMT\r\n"
-> "Content-Type: text/plain\r\n"
-> "Content-Length: 28\r\n"
-> "\r\n"
reading 28 bytes...
-> "Invalid json line 1 column 7"
read 28 bytes
Conn keep-alive
=> "Invalid json line 1 column 7"
```

<!--more-->

Invalid json? The `body` was being passed into `HTTParty` as a hash, I had been assuming this would convert it to JSON. 

```rb
.
body: { token: their_token },
.
```

So, I fired up `netcat` on localhost, to try making different `POST` requests and watch the formatting a little closer:

```
nc -l -k localhost 4000
```

I was seeing requests like so:

![looks OK, right?](/images/2019-03-11 at 11.09 AM.png)


what was the solution?

My coworker [John Livingston](https://github.com/Jliv316) was chatting with me about a PR he had open, and asked for a review on an update to a Slack notification bot. I saw him use a suspicious method inside of _his_ HTTParty request.


```rb
response = HTTParty.post(url, {
        body: payload.to_json,
        headers: {'Content-Type' => 'application/json'}
      })
```

AHHHHHHHH

![AHHHHHHHH](https://media.giphy.com/media/p8Uw3hzdAE2dO/giphy.gif)

Because I'd also been working on a _different_ post request, where the `Content-Type` was `application/x-www-form-urlencoded`, I wasn't actually looking to make sure the `body` was putting out JSON. Of course this isn't JSON. 

#### Not json:

```
token=slkdjflkj
```

#### json:

```
{"token":"slkdjflkj"}
```

The fix? add `.to_json` on the request body:

```ruby
options = {
  headers: {
    "Content-Type": "application/json",
    authorization: "Bearer #{our_token}",
  },
  query: { data: true },
  body: { token: their_token }.to_json
  # I just added .to_json      ^^^^^^^
}
```

I'm writing this whole thing out because in hindsight it's blindingly obvious what the problem was, but at the time I was _really_ stuck on why the endpoint couldn't parse the body as json. 

Now we all know.

