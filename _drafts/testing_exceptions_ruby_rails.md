---
layout: post
title:  "Title"
date:  2018-05-27 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [ruby, rails, testing]
permalink: testing-exceptions-ruby-rails
---

Last time, [I talked about using mocks and stubs]({{ site.baseurl }}{% link _posts/2018-05-26-mocks_stubs_exceptions_ruby.md %}) to set up tests for getting error codes from third party services.

Today, my learning goals (and therefore my explaining goals) are:

- deconflict the proper usages of `raise`, `rescue`, and `ensure`.
- Understand non-linear raise/rescue/ensure blocks
- Test as much of the above as possible.

The original purpose of the exploration was to dig into some unusual behavior I observed doing some testing in our rails app.

Here's some pseudocode of how it was set up, with comments added to show where I was (and, to some extent, still am) confused:

```ruby
class DoStuff

  def perform_operation
    # this method was actually 60+ lines long, and doesn't end until the
    # 'end' after the 'ensure' ten lines below statement. No shortage of my
    # confusion came from the 200+ lines of code in this class that was all
    # rather wrapped together
    if all_seems_ok
      send_payload_to_service
      # from a 'callers' perspective, all of 'send_payload_to_service' is
      # happening inside of 'perform_operation', and therefore any errors
      # raised inside that method will bubble up to be 'caught' by the
      # 'rescue' below
    end

  rescue ServiceNotFound => ex
    log(ex.message)
  ensure
    cleanup_database
  end

  def send_payload_to_service
    begin
      connection = Figaro.new()
      @response = connection.run
    end

    if @response.code == 404
      raise ServiceNotFound
      # this error would 'raise' inside of #perform_operation
      # AND!!! this @response.code error handling still seems to be
      # managed from inside the above begin..end block. (!!!)
    else
      log("operation complete with #{details}"
    end
  end
end
```

This code is rather tightly coupled, in my opinion. Jumping in and wrapping my head around all that was happening took a bit of reading and exploring. Fortunately, the class was well tested, and reading the tests painted a good picture of what was expected.

I'm going to continue building on the repository from my last post, and try to recreate a similar structure within it, so I can explore the error raising, handling, etc.


<!--more-->

I've got a working example. Commit: d6b960a

Here's the condensed test:

```ruby
require './lib/connection'
require 'minitest/autorun'
require "mocha/minitest"

class ConnectionTest < Minitest::Test

  def setup
    @conn = Connection.new
    @srv = mock('Service object')
  end

  def test_raise_error_when_service_returns_404_using_stubs
    @srv.stubs(:status_code).returns(404)

    assert_raises Connection::ServiceNotFound do
      @conn.connect_to_external_service(@srv)
    end
  end

end
```

And here's the class under test:

```ruby
class Connection

  attr_reader :status_code

  def do_something
    @status_code = get_service_status
  end

  def get_service_status
    # do complicated stuff to get status code
    # but for now, return a random status code to emphasize
    # how uncontrollable this status code might be
    [200, 404, 504].sample
  end


  def connect_to_external_service(srvc)
    puts "inside connect_to_external_service"
    begin
      puts "about to raise an error for #{srvc.status_code}"
      raise ServiceNotFound if srvc.status_code == 404
      puts 'I am after the raise. WILL I BE EXECUTED?'
    rescue => ex
      puts ex
    end
    puts "after the rescue, end of method"
  end

  class ServiceNotFound < StandardError; end
  class ServiceTimeOut < StandardError; end
end
```

And here's the condensed output from when I run that test:

```
> ruby test/connection_test.rb -n=/404/

inside connect_to_external_service
about to raise an error for 404
Connection::ServiceNotFound
after the rescue, end of method

  1) Failure:
ConnectionTest#test_raise_error_when_service_returns_404_using_stubs [test/connection_test.rb:21]:
Connection::ServiceNotFound expected but nothing was raised.
```

There are a few things of note here:

#### The `puts 'I am after the raise. WILL I BE EXECUTED?'` didn't get executed

I don't yet know what this means. Feels noteworthy, but of course, _this is exactly the expected behavior with error raising_. We either _intentionally_ raise errors when certain known problems happen, or of course Ruby/Rails itself will gladly raise errors for us when something goes awry.

As a side note, one of my favorite things about Ruby is its error messages. So verbose, so precise. I've very rarely received an error or exception that didn't shed _some_ light on the underlying problem.

When an error is raised, the program execution 'flow' is passed out of the current method and to ruby's `Exception` class. Execution is 'broken', and passed to the rescue clause and, in our example, skips over the `WILL I BE EXECUTED` message.

#### the exception format is quite basic: `Class::ExceptionName`

It can be whatever you want it to be, though.

```ruby
raise ServiceNotFound
=> 'Connection::ServiceNotFound'

raise 'ERROR: service not found'
=> 'ERROR: service not found'

raise "I'm a little tea-error, short and haut"
=>"I'm a little tea-error, short and haut"
```

#### The test doesn't know an exception was raised

This is the more interesting piece. Lets say I want to test that an error is raised when a service is unavailable, but I _also_ want to `rescue` said error - and I want this to all be tested!

See how the test failed above? Here's the error message again:

```
1) Failure:
ConnectionTest#test_raise_error_when_service_returns_404_using_stubs [test/connection_test.rb:20]:
Connection::ServiceNotFound expected but nothing was raised.
```

_nothing was raised_, even though we certainly raised an error.

Turns out we can fix the test all trickily - just drop another `raise` after the error handling, like so: (look at the bottom of the `rescue` block)

```ruby
def connect_to_external_service(srvc)
  puts "inside connect_to_external_service"
  begin
    puts "about to raise an error for #{srvc.status_code}"
    raise ServiceNotFound if srvc.status_code == 404
    puts 'after the raise. WILL I EXECUTE?'
  rescue => ex
    puts ex
    raise
  end
  puts "after the rescue, end of method"
end
```

So this works, _and_ the test knows that I've raised `Connection::ServiceNotFound`, not just a general error.

Parenthetically, if you pass a simple `raise`, with no additional arguments, it will raise a `RuntimeError`, with no further arguments.

# Begin..end

I'm not content with my usage of `begin` and `end`. _I don't know begin really does, though it's mentioned in every article on exception handling in Ruby_.




### Resources and helpful reading

- [Ruby Exceptions](http://rubylearning.com/satishtalim/ruby_exceptions.html)
- [Ruby Error Handling, Beyond the Basics](https://www.sitepoint.com/ruby-error-handling-beyond-basics/)
- [Weird Ruby Part 1: The Beginning of the End](https://blog.newrelic.com/2014/11/13/weird-ruby-begin-end/)
- [Unlocking Ruby Keywords: Begin, End, Ensure, Rescue](http://vaidehijoshi.github.io/blog/2015/08/25/unlocking-ruby-keywords-begin-end-ensure-rescue/)
