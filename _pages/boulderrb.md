---
layout: page
title: Boulder.rb meetup notes
status: publish
type: page
published: true
meta: {}
permalink: boulderrb
---

Notes from the Boulder.rb talk:

## Slow Query lookup:

check to see what your current values are for [`long_query_time`](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_long_query_time)

```sql
SELECT
  start_time
  ,user_host
  ,query_time
  ,sql_text
  ,lock_time
  ,rows_sent
  ,rows_examined
  ,db
  ,last_insert_id
  ,insert_id
  ,server_id
  ,thread_id
FROM
  mysql.slow_log
WHERE
  start_time >= DATE_ADD(current_timestamp, INTERVAL -1 DAY)
  ORDER BY
    query_time DESC
LIMIT 10000;
```

### Additional reading

- [Ruby-prof (gem) docs](https://github.com/ruby-prof/ruby-prof)
- [3 ActiveRecord Mistakes That Slow Down Rails Apps: Count, Where and Present](https://www.speedshop.co/2019/01/10/three-activerecord-mistakes.html)