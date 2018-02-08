---
layout: post
title:  "Testing Rake Tasks in Rails"
date:  2018-02-08 06:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [ruby, rails, testing]
permalink: test-rake-tasks-in-rails
---

I recently wrote a rake task to update some values we've got stored in the database. The rake task itself isn't important in this post, but testing it is.

We've got many untested rake tasks in the database, so when our senior dev suggested adding a test, I had to build ours from scratch.

I did a bit more whack-a-moling with error messages than I'd hoped, so here's a template of that test, along with some details that might save you some time, next time _you_ are writing tests for your rake tasks.

We're in a not-new version of Rails, and using Minitest. I've anonymized it. Hope it's useful!

```ruby
# test/tasks/rake_task_file_test.rb

require 'test_helper'
require 'rake'

class RakeTaskFileTaskTest < ActiveSupport::TestCase

  describe 'namespace:task_name' do

    def setup
      @tt = Fabricate(:object_with_attributes_i_need_to_change)
      ApplicationName::Application.load_tasks
      Rake::Task["namespace:task_name"].invoke
    end

    it "should change 'thing I don't want'" do
      @tt.reload
      values = @tt.attribute_i_changed
      refute_includes values, "thing I don't want"
      assert_includes values, "thing I do want"
    end

  end
end
```
<!--more-->

Notes on the above:

- `require 'rake'` - I was getting a `NoMethodError: undefined method 'namespace' for main:Object` until adding this line. Found the answer in an unrelated-ish [github issue](https://github.com/resque/resque-scheduler/issues/472), of course.

- The rake task reads `@tt.attribute_i_changed`, does logic on it, and then changes the value. The object I was changing had quite a few dependencies on _other_ objects, so I just copied an existing factory, changed the values as needed, and called that factory in the `initialization` method.

- `ApplicationName::Application.load_tasks` makes all the rake tasks available inside this test. Without `.load_tasks`, nothing else works.

- `Rake::Task["namespace:task_name"].invoke` runs the task under test.

- `@tt.reload` is very important. It's obvious in hindsight, but since the rake task modified values of `@tt`, I have to reload it from the database. Otherwise, the test has no idea the values changed when I call `@tt.attributes_i_changed`

- And a few standard `refute_includes` and `assert_includes`, and we're on our way.


### Useful resources

- [Thoughtbot: Test Rake Tasks Like a BOSS](https://robots.thoughtbot.com/test-rake-tasks-like-a-boss)
- [Ilija Eftimov: Why and how to test Rake tasks in your Rails application](https://ieftimov.com/test-rake-tasks)
- [Pivotal blog: Test your Rake tasks!](https://content.pivotal.io/blog/test-your-rake-tasks)
