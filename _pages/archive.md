---
layout: page
title: Archive
permalink: /archive
---

# Blog Posts

{% for post in site.posts %}
  * [ {{ post.title }} ]({{ post.url }}) _{{ post.date | date: '%b %Y' }}_
{% endfor %}
