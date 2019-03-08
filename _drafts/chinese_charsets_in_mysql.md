---
layout: post
title:  "Troubleshooting Chinese Character Sets in MySQL"
date:  2019-03-08 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [mysql, rails]
permalink: troubleshooting-chinese-character-sets-in-mysql
---

A while back, I picked up a bug where when a customer tried to save certain kinds of data using Chinese characters, we were replacing the Chinese characters with a series of `?`.  

This will be a quick dive through how I figured out what the problem was, and then validated said problem, and then what the actual fix is.

This isn't just a story, though. Debugging skills are valuable, and just like any other skill, they can be sharpened. I have built competence in this domain, and I wanted to record some of the process and thought processes.

I perceive good debugging to go hand-in-hand with asking good questions. [I wrote a whole post]({{ site.baseurl }}{% link _posts/2017-05-29-ask-better-questions.md %}) about how asking good questions is _hard_, but done well makes it easy for someone else to help you, and leads to deeper understanding of the space. 

Debugging, done rightly, should lead in the same direction. As you work through the process, you should be building a mental model of the surrounding portions of the application, or the problem, validating assumptions, etc. 

Good debugging is also a particularly useful skill a developer could bring to their job, _and you don't have to be an experienced developer to be good at debugging_. You could argue good debugging is based more on attitude than technical know-how, so if you're just getting your start in the software development industry, making sure you're good at debugging things _and then telling potential employers this_ could be to your advantage. 

Onward!

_A bit of house-keeping - this post is born out of notes I was making as I worked through the process. I often create a document of notes based on the current ticket I'm working on. Obviously that document isn't fit for public consumption, so the following is an editorialized version of this document, with modified screenshots, logs, etc._

# Reproducing the bug

Not all bugs can be reproduced. That makes them particularly challenging. But if a bug cannot be reproduced, that's a bunch of useful signal in itself. 

So, you need to determine if this bug can be replicated. 

I started here, as just reading through the ticket description, I knew this would be easy to see if I could replicate it:

![setup](https://cl.ly/2X3o2x3s0l12/2018-05-30%20at%202.52%20PM.png)

The results:
<!--more-->

![question marks](https://cl.ly/2K412U3E3i2W/2018-05-30%20at%202.53%20PM.png)

### Reproduce on localhost? 

OK, I'm gonna see if I can reproduce this locally.

Only 'gotcha' was in `campaigns#index`, the app was throwing errors because I had a campaign in my database created by a user that was no longer in the database. I deleted the given campaign from the DB, and all is groovy.

So, now to see when and where we're losing that character encoding. 

# Where is encoding being stripped/broken/lost/'misplaced'?

When building the campaign, I see a `POST` request containing everything correctly encoded, I think (some params removed for readability):

```
{
   "method":"POST",
   "path":"/account/usb_campaigns/79",
   "format":"json",
   "controller":"account/usb_campaigns",
   "action":"update",
   "status":200,
   "utf8":"\u2713",
   "usb_campaign":{
      "title":"these are lost \u4e16\u754c < those were lost",
      "file_details_attributes":{
         "0":{
            "id":"7",
            "nonce":"294033000",
            "_destroy":"false",
            "extension":"xlsx",
            "basename":"chars.\u4e16\u754c.chars"
         }
      },
      "device_quantity":"10",
      "address_attributes":{
         "id":"7",
         "company_name":"ThreatSim Development",
         "name":"f",
         "street1":"f",
         "street2":"",
         "city":"f",
         "country_code":"US",
         "state":"GU",
         "zip":"11111",
         "email":"lwhalin+super@wombatsecurity.com",
         "phone_number":"1111111111"
      },
      "id":"79"
   },
   "training_type_campaign_type":"USB",
   "_method":"put",
   "draft":"true",
   "id":"79",
   "message":"[200] POST /account/usb_campaigns/79 (account/usb_campaigns#update)"
}
```

But when we take a look at the database, we've lost the encoding:

from the `usb_campaigns` table on `localhost`:

![bad encoder!](https://cl.ly/032L2S0r0h3b/2018-05-30%20at%205.37%20PM.png)

Ditto on the filename:

![bad file name encoder!](https://cl.ly/3U1X3C3e3j0x/2018-05-30%20at%205.38%20PM.png)

## How do we store these values in the database? 

I'm first looking in the controller, to try to localize this a bit:

```ruby
# app/controllers/account/usb_campaigns_controller.rb:93

  def update
    require "pry"; binding.pry
    @campaign = current_user.account.usb_campaigns.find(params[:id]).decorate
    authorize @campaign

    saver.save

    respond_with @campaign
  end
  ```
With that pry, my `params` hash has everything as I expect it:

![params](https://cl.ly/2y2i3d3W1w11/2018-05-30%20at%206.02%20PM.png)

but if I play the line right under the require, and look at the object, it has lost the encoding:

![don't fail me now](https://cl.ly/381p3D1Q0b26/2018-05-30%20at%206.04%20PM.png)

So, why is chinese encoding being lost? And where, precisely, is this object being built and modified?

Stepping through the method, line by line:

```ruby
@campaign = current_user.account.usb_campaigns.find(params[:id]).decorate
```

Seems unrelated to saving the campaign. Just calls the decorator. Maybe to make sure that new values are captured next time someone looks at the campaign page? (I don't know why `.decorate` is called on the end of the whole thing, but other lines look more relvent)

```ruby
authorize @campaign
```

no clue what it is doing. We have no `def authorize` in our app. Tons of references like `authorize @custom_training`, (about 122 instances) but can't tell where it's coming from. 

[The cancan gem](https://github.com/ryanb/cancan) seemed like it might be involved, but we don't have it in the gemfile. 

`ApplicationController` doesn't have `before_filter :authorize`. 

Looks like [pundit](https://github.com/RailsApps/rails-devise-pundit) might be in play here. Not relevant to our current bug, but looks interesting, and I'd like to explore it later. 

```ruby
saver.save
```

Now we're getting somewhere. This line calls another method in our class (`Account::USBCampaignsController` in case you forgot... I just did.)

```ruby
# app/controllers/account/usb_campaigns_controller.rb:147

  def saver
    @saver ||= USBCampaign::Saver.new(campaign, draft?, usb_campaign_params, end_at_params, request.remote_ip)
  end
```

And, this new `USBCampaign::Saver` object of course has `#save` available to it:

```ruby
# app/services/usb_campaign/saver.rb:18

  def save
    EndDateParser.new(campaign, **end_at_params.symbolize_keys).parse!
    campaign.assign_attributes(usb_campaign_params)

    if campaign.may_draft? && saving_draft
      campaign.draft!
    elsif campaign.may_submit? && !saving_draft
      if campaign.submit!
        notify_support_of_new_usb_campaign!
      end
    else
      campaign.save
    end
  end
```

If we dig into that second line, the `usb_campaign_params` are the expected values containing chinese characters, and [`assign_attributes`](http://api.rubyonrails.org/classes/ActiveModel/AttributeAssignment.html#method-i-assign_attributes) is the standard way to update database values. 

here's the params going into the `assign_attributes` function:

![trying to change variables](https://cl.ly/3X2Z1x2k1y0B/2018-05-30%20at%206.58%20PM.png)

hm. `campaign.save` worked. I didn't expect it to:

![save](https://cl.ly/0u2U39363w0p/2018-05-30%20at%207.01%20PM.png)

Lets check the database. 

![not expected](https://cl.ly/092d2A2i0z16/2018-05-30%20at%207.03%20PM.png)

So why is my new object showing the wrong values?

AHA! `campaign.reload` for the win. I hadn't pulled in new values from the DB, which seemed to fail to save correctly.

![betrayed!](https://cl.ly/2v262N3O2U0n/2018-05-30%20at%207.05%20PM.png)

This leads to some obvious questions.

# Does our database support Chinese characters?

First, does our database support "unusual" characters? here's my super sophisticated, professional-level test:

![german characters](https://cl.ly/2n3S0t3M210M/2018-05-30%20at%207.09%20PM.png)

So, there's one set of character encoding. Lets try japanese:

Ah, interesting. I tried to paste in:

> Hiragana. Hiragana (平仮名, ひらがな, Japanese pronunciation: [çiɾaɡana]) is a Japanese syllabary, 

and got: 

![japanese chars](https://cl.ly/0B1E2g3Z1n2b/2018-05-30%20at%207.12%20PM.png)

Looks suspiciously like our problematic chinese characters:

> 世界

![no dice](https://cl.ly/310m0S3P4012/2018-05-30%20at%207.14%20PM.png)

OK, the problem is how MySql handles these character sets. 

---------------------------------------------------

Fortunately, the internet exists.

Here's what I'm looking through for inspiration:

- [php: Can't insert Chinese character into MySQL](https://stackoverflow.com/questions/14456313/cant-insert-chinese-character-into-mysql)
- [MySQL 8.0 FAQ: MySQL Chinese, Japanese, and Korean Character Sets](https://dev.mysql.com/doc/refman/8.0/en/faqs-cjk.html)

From the MySQL docs, some notes as I follow their instructions:

First, CLI access to `mysql` running on docker:

`mysql -h 127.0.0.1 -P 3306 -u root -p`

```sql
mysql> SELECT VERSION();

+-----------+
| VERSION() |
+-----------+
| 5.6.38    |
+-----------+
```

### Make sure that the database is actually using the desired character set

```sql
SELECT character_set_name, collation_name
    FROM information_schema.columns
    WHERE table_schema = 'threatsim_development'
        AND TABLE_NAME = 'usb_campaigns'
        AND COLUMN_NAME = 'title';
```

gives:
```
+--------------------+-------------------+
| character_set_name | collation_name    |
+--------------------+-------------------+
| latin1             | latin1_swedish_ci |
+--------------------+-------------------+
1 row in set (0.00 sec)

```


```sql
SELECT HEX('title')
FROM usb_campaigns;
```
### Determine the hexadecimal value of the character or characters that are not being displayed correctly. 

gives:

```
+--------------+
| HEX('title') |
+--------------+
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
| 7469746C65   |
+--------------+
```


### Make sure that a round trip is possible. When you select `literal` (or `_introducer hexadecimal-value`), do you obtain `literal` as a result? 

```sql
SELECT 'ペ' AS `ペ`;
```

returns:

```
?
```

This seems noteworthy. 

And:

```sql
SELECT '世界' AS `世界`;
```
returns:

```
??
```

The plot thickens:

![eureka?](https://cl.ly/1y0a3G1K0W25/2018-05-31%20at%2012.38%20PM.png)

OK, it's a per-table encoding problem. Our `campaigns` table can handle these values just fine, but not `usb_campaigns`:

![not working](https://cl.ly/1q3d0x3f2606/2018-05-31%20at%2012.39%20PM.png)

# on a per-table basis, changing `character_set_name`

Lets compare a table where these character encodings work (`campaigns`) to where they don't (`usb_campaigns`):

```sql
SELECT character_set_name, collation_name
    FROM information_schema.columns
    WHERE table_schema = 'threatsim_development'
        AND TABLE_NAME = 'campaigns'
        AND COLUMN_NAME = 'title';
```

gives:

```
+--------------------+--------------------+
| character_set_name | collation_name     |
+--------------------+--------------------+
| utf8mb4            | utf8mb4_unicode_ci |
+--------------------+--------------------+
```

Remember that `usb_campaigns` gave:

```
+--------------------+-------------------+
| character_set_name | collation_name    |
+--------------------+-------------------+
| latin1             | latin1_swedish_ci |
+--------------------+-------------------+
```

I bet if we changed the table encoding method, we'd be good to go!

[Stackoverflow](https://stackoverflow.com/questions/3513773/change-mysql-default-character-set-to-utf-8-in-my-cnf) for the win. Suggested:

`ALTER TABLE Table CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci;`, which I changed to:

```sql
ALTER TABLE threatsim_development.usb_campaigns 
CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

And now, when I check the `character_set_name`, I get:

```
+--------------------+--------------------+
| character_set_name | collation_name     |
+--------------------+--------------------+
| utf8mb4            | utf8mb4_unicode_ci |
+--------------------+--------------------+
```

Wahoo!

![it worked](https://cl.ly/2Y2j43262e3H/2018-05-31%20at%2012.52%20PM.png)

-----------------------------------------------

# Editing tables on a oneshot

So, lets sanity-check this in the app. If it works, I'll update the table where we're having the file_names problem too, and then I'll figure out how to change this in production. 

Wahoo! It works. I updated `usb_campaigns` and `usb_campaign_file_details`, and all is groovy:

![it works!](https://cl.ly/011s0W3x2s2b/2018-05-31%20at%201.28%20PM.png)

----------------------------------------------------

Now to test on a oneshot!

I've SSH'ed in to https://autoenrollmentrequeuefailure.threatsim.net/, and ran 

```sql
ALTER TABLE threatsim_staging.usb_campaigns  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE threatsim_staging.usb_campaign_file_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

And it's fixed!

![fixed!](https://cl.ly/1i2q1q3p0k1L/2018-05-31%20at%203.03%20PM.png)

-----------------------------------

# Rails migration for `character_set_name`

I've reset the `usb_campaign_file_details` table to `latin1`, `latin1_swedish_ci`, and I'm going to work on a rails migration that will update it.

Scratch that - Laura suggested asking Jordan directly.

# Asking Jordan for help

Hi Jordan! There are two tables to change the `character_set_name` on. 

I don't know if it makes more sense to change the whole table, or just the column. 

The tables are:

- `threatsim_staging.usb_campaign_file_details`
- `threatsim_staging.usb_campaigns`

These two commands, run on a oneshot, fixed all the above problems:

```sql
ALTER TABLE threatsim_staging.usb_campaigns  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE threatsim_staging.usb_campaign_file_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Since I know _almost nothing_ about updating production databases, and you know _lots_ of things, I would love to know your professional opinion on how to implement the above changes. 

For a quick-and-dirty check of what the problem is, read through [Does our database support chinese characters?](#does-our-database-support-chinese-characters)



Inspiration:

- [this gist of other's migrations to do just this](https://gist.github.com/tjh/1711329)
- [stack overflow: define character in rails migration](https://stackoverflow.com/questions/5746633/define-character-in-rails-migration)


### Resources

- [Thoughts on Debugging, Part 1, by Mark Dalrymple](https://www.bignerdranch.com/blog/thoughts-on-debugging-part-1/)