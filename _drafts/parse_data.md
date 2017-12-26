---
layout: post
title:  "Parsing open data for voters in Golden"
date:   2017-08-28 06:18:52 -0600
categories: programming
permalink: parse-data-for-voter-records
---
I'm running for Golden's City council.

To get elected, I need to get people to vote for me. (Shocking, I know!)

So, per [Grant Henninger's](https://twitter.com/granthenninger?lang=en) great advice, I started looking for a list of residents in Golden that meet certain criteria.

I quickly found two sources of this data:

1. The super-crusty "order a PHYSICAL CD of data" page from Jefferson County's [election data tool](http://jeffco.us/elections/data-request/).
2. [ColoradoVotors.info](https://coloradovoters.info/by_address/80401.html)

The trick to everything in life is constraints. I'm working with the data from ColoradoVotors.info for the moment, and need to whittle it down based on the following:

1. The individual must be actively registered to vote
2. The individual must live in Golden
3. The individual must live within ward 2, district 1

![ward map](/images/parse_data_ward_map.jpg)

I live in Ward 1, District 1, and don't want to keep anyone on the list in any other ward.

Here's the challenge, though. If I want to filter voters by zip code, I'll end up with way more people than appropriate:

![golden zip code map](/images/parse_data-golden-zip-code-map.jpg)

So, I need to get the voters in Colorado with a zip of 80401, and filter down from there.

I don't know how I'm going to do this, but here we go!


---------------
I was getting set up to parse the coloradoVoters page by zip code via Ruby's Nokogiri tool... but I heard back from JeffCo. All their data is available via dropbox. Woot! Just pulled it into Excel, and I'll clean it up there.
---------------

Importing it into Excel, and... it's almost half a million rows of data. Poo. Excel cannot handle it. Now I have to see about importing this data into a PostgreSQL table.

Hm. Excel is working. Downloaded it, filtered by those who's city is "Golden", and down to about 40,000 people.
