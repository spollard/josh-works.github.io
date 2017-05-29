---
layout: page
title: Blog Posts by Tag
---

Click on a tag to see a relevant list of posts.

<ul class="tags">
{% for tag in site.tags %}
  {% assign t = tag | first %}
  {% assign posts = tag | last %}

{{ t | downcase }}
<ul>
{% for post in posts %}
  {% if post.tags contains t %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <span class="tag_date">{{ post.date | date: "%B %-d, %Y"  }}</span>
  </li>
  {% endif %}
{% endfor %}
</ul>
{% endfor %}
