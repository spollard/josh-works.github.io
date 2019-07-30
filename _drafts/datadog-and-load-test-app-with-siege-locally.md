---
layout: post
title:  "Load Testing An App Locally, Sending The Results To Datadog"
date:  2019-07-29 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails_performance, rails, data_dog]
permalink: datadog-apm-on-localhost-load-testing-with-siege
---


OK, time to see what siege can do to my app.

I'm doing a few runs:

```
$ siege --header="Cookie: _ts_session_id=999480972c8133ecdec0ae1585cc88f7, \ fd827a2c5655094bcce3748d6ee6d3e4=ImRhMDY1YjdjYjMwNGNjNWUxNzFkNDhjOGQ0YzA0OTIwIg%3D%3D--98c228cb35af1a269ee894c22540b81848e2ed09" \
-f all_campaign_urls.txt --concurrent=1 -t 60s


$ siege --header="Cookie: _ts_session_id=999480972c8133ecdec0ae1585cc88f7, \ 
fd827a2c5655094bcce3748d6ee6d3e4=ImRhMDY1YjdjYjMwNGNjNWUxNzFkNDhjOGQ0YzA0OTIwIg%3D%3D--98c228cb35af1a269ee894c22540b81848e2ed09" \
-f all_campaign_urls.txt --concurrent=2 -t 60s
```
<!--more-->

More text
