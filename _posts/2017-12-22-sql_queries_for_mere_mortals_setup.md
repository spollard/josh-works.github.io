---
layout: post
title:  "Setting up for 'SQL Queries for Mere Mortals'"
date:  2017-12-22 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [sql, programming, databases]
permalink: setting-up-sql-queries-for-mere-mortals
---


This tweet is from... a while ago. Turns out I didn't dig into this book, because the pace at Turing didn't allow for a few weeks of thinking _just_ about SQL.


<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">yes, I&#39;m digging into sql to better my AR skills, and ultimately whatever I need to use next. <a href="https://t.co/UhjyGKv1FQ">pic.twitter.com/UhjyGKv1FQ</a></p>&mdash; Josh Thompson (@josh_works) <a href="https://twitter.com/josh_works/status/856596417095229441?ref_src=twsrc%5Etfw">April 24, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


I've got more time in my life now, and the company I work for makes _heavy_ use of SQL queries, so I'm spending a little time each day working through this book. The following started as a gist, and I'm putting here, so I can more easily share it with others.

### Why Study SQL

Pretty much everything on the internet lives in a database. I figure any boost to my SQL skills will provide outsized returns down the road.

For example, just _today_ I used some basic SQL queries to validate an assumption I had about the frequencies of `null` values in certain places in our database. I wouldn't have even thought to try that, if I didn't know in advance what I could do with a basic SQL query.

If you buy this book, and want to get set up with it's accompanying data on your own computer, so you can practice yourself and follow along with the book... read on.

The friction of getting set up kept me from getting started with this book, and I don't want that to happen to you too. :)
<!--more-->


--------------------------

I'm working on wrapping my head around SQL. Be it MySql, SQLite, PostgreSQL, etc - these are all relational database management tools, and (I assume) they have much in common with each other.

I've got a copy of [SQL Queries for Mere Mortals](http://www.informit.com/store/sql-queries-for-mere-mortals-a-hands-on-guide-to-data-9780321992475), and I plan on spending some time each day over the next ~month working through the lessons.

Lesson 1 is "setting the damn thing up". I struggled so much getting it set up, I wrote [this gist](http://www.informit.com/store/sql-queries-for-mere-mortals-a-hands-on-guide-to-data-9780321992475) and gave it to a [former coworker/awesome developer](https://twitter.com/richthofen) when he offered to help.

Turns out, he helped me set it up! I got it working!

And then Turing took over my life, and I stopped studying, then I got a job, and moved machines, and had to start the install from scratch.

So, I'm writing this guide as if _you_, dear reader, wanted to follow along through the book, and needed help getting the "dev environment" set up locally.

## Step 1 - install MySQL on your machine

_note: I ended up wiping my entire MySQL local install and instead setting it on Docker. My company uses MySQL 5.6, which is a generation behind the current 5.7, and navigating between the two locally was a massive headache. The rest of this will still work, if you're good running MySQL 5.7._

I don't have much help for you here. I struggled hard on this. Turns out I was using Brew to manage MySQL, and that wasn't playing nice with other tools, so I threw my hands in the air, and did a clean uninstall/re-install of MySQL on my machine.

I followed [these instructions](https://coderwall.com/p/os6woq/uninstall-all-those-broken-versions-of-mysql-and-re-install-it-with-brew-on-mac-mavericks) to remove/reinstall.

And, the last setup command in the instructions is deprecated. Where it says to use:

```
mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
```
instead use:

```
mysqld -initialize --verbose --user=whoami --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
```

(The latter came from a comment in the article.)

In your command line, try to run `mysql`. If it lets you in, great! if not... read on

## Step 1.1 - creating a user for MySQL

I followed the instructions in [this StackOverflow post on creating MySQL users](https://stackoverflow.com/a/25728868/3210178) and got it working:

```
$ mysql -u root

mysql> CREATE USER 'joshthompson'@'localhost' IDENTIFIED BY 'super_secret_password';
Query OK, 0 rows affected (0.00 sec)

mysql> GRANT ALL PRIVILEGES ON * . * to 'joshthompson'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.00 sec)

```
and now I can connect to the DB by running `$ mysql -p`. It asks for my password, I enter it, and I'm good to go.

## Step 2 - import sample date on your machine

I'm using [Sequel Pro](https://www.sequelpro.com/) at the moment. I _think_ you could do this all from the command line, but since I use Sequel Pro for my real job, I want to build familiarity with the tool. (Despite "pro" in the name, the software is free.)

In Sequel Pro:

```
name: Local Development
host: 127.0.0.1
username: your_username
password: your_password
```

click `connect`

You should now be connected to a database in Sequel Pro, and you're ready to import some data.

The book includes companion data so the reader can practice the queries mentioned in the book. [Here's the readme for the data](http://ptgmedia.pearsoncmg.com/imprint_downloads/informit/bookreg/9780321992475/9780321992475_README.html). The data itself is in a zip available under the "downloads" section [here](http://www.informit.com/store/sql-queries-for-mere-mortals-a-hands-on-guide-to-data-9780321992475#bss6773f413-100c-4ba8-a4a8-9325c9342776)


In Sequel Pro, go to `File > Import`, and navigate to the data you downloaded and unzipped.

I started small, and imported everything prefixed with `00`. As far as I can tell, all the files prefixed with `00` relate to the schema, but not the actual data. If you import one or all of them, you'll see a very robust schema, with many tables and keys, but no actual content.

![what the files are/do](/images/sql_01.jpg)

After importing the nine `structure` files, you might see something like this:

![structure only](/images/sql_2.jpg)

And, after importing the `data` files:

![now with data](https://cl.ly/2C282K29371K/_MySQL_5_7_20__127_0_0_1_SalesOrdersModify_Customers02.jpg)

OK! I'm big on getting friction out of the way, and this is helpful. I'll not touch the `02` files related to `views` yet, because _i have no idea what those do_.

Lets spot check this to make sure it works.

I've got the Third Edition of _SQL for Mere Mortals_, published in 2014. I can pop over to page 98, in chapter 4, and run an example query on a given database, to see if it works.

Here we go...

The query is (in plain english) "Show me the names of all our vendors".

In sql:

```sql
SELECT VendName FROM Vendors;
```

Easy enough. The only thing to be mindful of seems to be selecting the right database. If the database doesn't have the `Vendors` table, the query comes up blank. So I jump into one of the databases with a `vendors` table, run the above query, and have results! (I ran it against both `SalesOrdersExample` and `SalesOrderModify`, and got the same thing.

![success](/images/sql_04.jpg)

OK, that does it for now. I'm gonna carry on with my learnings elsewhere, and will update this gist occasionally, as needed.

The rest of my thinking on MySQL will _hopefully_ just be on the actual building and executing queries, both as the relate to this book, and things I'm learning/wrestling with on the job.

Just for fun, and to familiarize myself with the databases and tables, I quickly worked through everything in chapter 4. It's super basic select stuff from single tables, no joins or groupings or anything.

Onward!
