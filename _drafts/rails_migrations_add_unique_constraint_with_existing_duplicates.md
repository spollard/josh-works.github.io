---
layout: post
title:  "Rails Migration: When you can't add a uniqueness constraint because you already have duplicates"
date:  2018-10-01 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [rails]
permalink: add_uniqueness_constraint_on_column_with_existing_duplicates
---

For work, I picked up a bug where a CSV export was creating duplicate rows when it shouldn't have been.

We generate the CSV export with a big ol' SQL statement in some Elixir workers, and got the bug reproduced and found the problem was with how we did some joins on other columns. 

We had something in the statement like this:

```sql
LEFT OUTER JOIN `reports` ON `reports`.`id` = `people`.`report_id`
LEFT JOIN `addresses` ON `addresses`.`people_id` = `people`.`id`
LEFT JOIN `favorite_colors` ON `favorite_colors`.`people_id` = `people.id`
```

In this highly contrived example, I found out that we're expecting a single row in the `favorite_colors` table for each `person`, but we were getting multiple `favorite_color` rows. 

Every time we had a duplicate row on that joined table, the `LEFT JOIN` created two rows in the export, even though there should have been one. 

<!--more-->

[thoughtbot has an amazing article about the exact problem we were having](https://robots.thoughtbot.com/the-perils-of-uniqueness-validations).

In that article, they describe the problem with uniqueness validations like so:

![unique_without_index](https://cl.ly/d8225ca9d570/unique_without_index.png)
_https://robots.thoughtbot.com/the-perils-of-uniqueness-validations_

We need to enforce uniqueness at the _database_ level. Not the model level. 

## What's the easy fix?

The "easy" fix is simple - Add an index to the column you want to enforce uniqueness upon, then add a uniqueness constraint:

(since this column already happened to have an index, we have to remove it and re-add it in the migration)

```ruby
class AddUniquenessConstraintToFavoriteColors < ActiveRecord::Migration
 def change
   remove_index :favorite_colors, :person_id
   add_index :favorite_colors, :person_id, unique: true
 end
end
```

Lets make this a bit more explicit. We'll define an `up` and `down` migration. (you'll see why in a moment)

### Slightly more complex

I'm a newbie to Rails migrations, so I'm going to be explicit about the up and down, for the rollback:

```ruby
class AddUniquenessConstraintToFavoriteColors < ActiveRecord::Migration
  def up
    remove_index :favorite_colors, :person_id
    # you can't MODIFY the index, just remove it, then re-add it with the changes
    add_index :favorite_colors, :person_id, unique: true, algorithm: :inplace
    # unique forces uniqueness (duh) and 
  end
  def down
    remove_index :favorite_colors, :person_id
    # removing the index that has uniqueness constraint
    add_index :favorite_colors, :person_id
    # adding one without the constraint
  end
end
```

This migration will work, _if_ you run it against a table that doesn't have duplicate values in the given column.

But the _whole reason_ I was googling all this was because I had a table with duplicate values. This is a table that now has many rows of data, and more than a few duplicates. 


If you run the above migration, and there are duplicates on the table, you'll get a lovely stack trace and error like:

```
== 20180914203948 AddUniquenessConstraintToFavoriteColors: migrating ========================
-- remove_index(:favorite_colors, :person_id)
   -> 0.0388s
-- add_index(:favorite_colors, :person_id, {:unique=>true, :algorithm=>:inplace})
rake aborted!
StandardError: An error has occurred, all later migrations canceled:

Mysql2::Error: Duplicate entry '44' for key 'index_favorite_colors_on_person_id': CREATE UNIQUE INDEX `index_favorite_colors_on_person_id`  ON `favorite_colors` (`person_id`) ALGORITHM = INPLACE
```



The big question was:

> How do we clean up the duplicates, _and_ run the migration, without duplicates showing up between when we clean them up and run the migration?

My first thought was a rake task to find and prune duplicates, but this is a relatively active table, and if even a few seconds elapsed between the rake task and migration, we might get another duplicate on it, which would prevent the migration from running. 


# The Solution

The rake task was a bad idea. Fortunatly, I work with many people who are much smarter than I, and they put me on the right track. I needed to update the migration to run a query that would:

1. Find all duplicate rows
2. Get the ID's of those duplicate rows
3. Trim one of the row IDs of the "duplicates" list
4. Delete all the remaining IDs. 

So, the SQL query gets built up in three pieces. Lets unpack it. First, here's a little SQL you could run locally to generate results to play with:

```sql
CREATE TABLE favorite_colors (
  ID INT AUTO_INCREMENT PRIMARY KEY ,
  person_id INT,
  color VARCHAR(255)
  );
INSERT INTO `favorite_colors` (`ID`, `person_id`, `color`)
VALUES
	(1, 1, 'yellow'),
	(2, 1, 'yellow'),
	(3, 2, 'blue'),
	(4, 2, 'blue'),
	(5, 3, 'green'),
	(6, 2, 'purple'),
	(7, 3, 'yellow'),
	(8, 4, 'black');
```

OK, first, lets find the duplicate rows. There's a lot of them in here:

```sql
SELECT  * 
FROM    favorite_colors fc
WHERE   EXISTS
        (
        SELECT  1
        FROM    favorite_colors tmp
        WHERE   tmp.person_id = fc.person_id
        LIMIT 1, 1
        )
ORDER BY fc.person_id
```





### Useful additional resources
- https://robots.thoughtbot.com/the-perils-of-uniqueness-validations
- https://stackoverflow.com/questions/48007376/rails-add-unique
- https://medium.com/@igorkhomenko/rails-make-sure-you-have-proper-db-indexes-for-your-models-unique-validations-ffd0364df26f
- https://dba.stackexchange.com/questions/138363/mysql-create-index-with-lock-none-still-locks-a-table