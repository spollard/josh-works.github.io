---
layout: post
title:  "MySQL concatenation and casting"
date:  2018-01-13 06:00:00 -0700
crosspost_to_medium: false
categories: [SQL]
tags: [MySql, sql_for_mere_mortals, programming]
permalink: mysql-concat-cast
---


I recently [set up my environment]({{ site.baseurl }}{% link _posts/2017-12-22-sql_queries_for_mere_mortals_setup.md %}) for working through _SQL for Mere Mortals_.

I'll record some interested tidbits here as I go.

## Chapter 5: Concatenation without the || operator

I use MySQL at work, and MySQL doesn't support the `||` operator for string concatenation.

So, in the book, an expression like:

```sql
ItemOne || ItemTwo
```
evaluates to `ItemOneItemTwo`

In MySQL, `||` is a [logical operator](https://dev.mysql.com/doc/refman/5.7/en/logical-operators.html#operator_or), just like in Ruby, so to get the above evaluation, you'd need to use:

```sql
CONCAT(ItemOne, ItemTwo)
```

That would give you `ItemOneItemTwo`. Of course, string concatenation pairs well with spaces between the strings you're trying to concatenate, so please know that the `CONCAT` function can take any number of arguments, for example:

```sql
CONCAT(ItemOne, ' ', ItemTwo)
```

would return `ItemOne ItemTwo`

<!--more-->

## CASTing

On page 147, the given SQL doesn't work in MySQL:

```sql
SELECT EngagementNumber,
  CAST(CAST(EndDate - StartDate AS INTEGER) + 1 AS CHARACTER) || ' day(s)' AS DueToRun
FROM Engagements
```

There's two problems. First, the concatenation issue mentioned above, so it would look like this:

```sql
SELECT EngagementNumber,
  CONCAT(CAST(CAST(EndDate - StartDate AS INTEGER) + 1 AS CHARACTER), ' day(s)') AS DueToRun
FROM Engagements
```

Secondly, the `CAST` function doesn't play as expected.

Here's a functioning query:

```sql
SELECT EngagementNumber, EndDate, StartDate,
  CONCAT(EndDate + 1 - StartDate, ' Day(s)') AS DaysToRun
FROM engagements
```

¯\\\_(ツ)\_/¯


## Enable `pipes_as_concat` mode?

I plan on just replacing any use of `||` in the book with the `CONCAT` function, unless someone suggests otherwise.

You _can_ run MySQL in [`pipes_as_concat`](https://dev.mysql.com/doc/refman/5.7/en/sql-mode.html#sqlmode_pipes_as_concat) mode, according to [StackOverflow](https://stackoverflow.com/a/24777235/3210178).

To enable it in the current MySQL session, in the query interface just run

`set sql_mode=PIPES_AS_CONCAT;`

Now you can try the pipes operator, and decide if you want it to be permanent or not.

## Summary

This is pretty basic stuff. Chapter 6 was just about using `WHERE` and `IS NULL` and `NOT LIKE` clauses to filter down result sets.

I rushed through it to get to the more interesting portion of the book, which is _Chapter 7: Thinking In Sets_ (AKA Joins tables!)
