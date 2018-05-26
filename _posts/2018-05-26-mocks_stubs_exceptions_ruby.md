---
layout: post
title:  "Mocks & Stubs & Exceptions in Ruby"
date:  2018-05-26 06:00:00 -0700
crosspost_to_medium: true
categories: [programming]
tags: [ruby, rails, testing]
permalink: mocks-stubs-exceptions-ruby
---

Some of my recent work has been around improving error handling and logging.

We had some tasks that, if they failed to execute correctly, were _supposed_ to raise exceptions, log themselves, and re-queue, but they were not.

The class in which I was working managed in large part API calls to external services, services that our team has no control over. Sometimes the services work great, sometimes they don't. The tests for this class made heavy use of mocks, stubs, and the [VCR gem](https://github.com/vcr/vcr).

This post was originally going to be about error handling, but then I realized I was getting a bit crossed up just by the mocks and stubs, so I took a quick detour into the topic, in order to build out a mental model of what was going on.

As I often do, I spun up a bare-bones implementation of all of the required pieces, to see how everything was playing together. [One guide](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest) I found was excellent, but the sample app was a bit over-kill. I didn't want a whole new rails app - I just wanted a class and test file.

_note: This isn't a tutorial, per se, but it's just two files and you can easily copy-paste the code into an editor and run the tests. I'll link to specific commits in a github repo throughout. Clone it down, check out the commit, poke around._

This project took me through:
- stubbing
- mocking
- raising exceptions
- rescuing exceptions
- testing all of the above

# What are mocks and stubs?

I'll admit - the "standard definition" of mocks and stubs didn't mean much to me. Quite a few definitions I found referenced "[the Fowler article](https://martinfowler.com/articles/mocksArentStubs.html)" which, while interesting, doesn't quite move me forward on testing Rails app _today_.

From [StackOverflow](https://stackoverflow.com/a/5164709/3210178)

> - mocks are objects that have a similar interface as something else
> - stubs are fake methods and return a specific answer

So, of course, I needed to see them function 'in the wild'.

# Eliminate dependencies on other classes in testing

I decided to make up this `service` and `connection` class.

Imagine I want to connect to a few different third-party services. I'll have a `connection` class into which I can pass a third-party service "object", and it should "connect".

<!--more-->

I will assume I can call `third_party_service.status` and get back `200`, `404`, `504`, etc.

I will also assume that sometimes _my own service_ will not function correctly, and so `my_service.status` can also be any particular status code, like `200`, `404`, `504`, etc.

I'd like to be able to test that I can raise specific errors if either `connection.status` or `third_party_service.status` is not `2xx`.

Here's my sample `Connection` class, where I've hard-coded the 200 status:

```ruby
class Connection

  attr_reader :status_code

  def initialize
    @status_code = get_service_status
  end

  def get_service_status
    200
  end

  def connect_to_external_service(srvc)
    return srvc.status_code
  end

end
```

And here's the test that shows all is groovy:

```ruby
class ConnectionTest < Minitest::Test

  def test_initializes_with_response_code
    c = Connection.new
    assert_equal 200, c.status_code
  end

end
```

Now, lets say I've got this third party service. Since I'm testing this all locally, and I want to square away mocking and stubbing anyway, I'm getting real fancy and I'm putting this in the same file as my `Connection` class:

```ruby
class Connection

  attr_reader :status_code

  def initialize
    @status_code = get_service_status
  end

  def get_service_status
    200
  end


  def connect_to_external_service(srvc)
    return srvc.status_code
  end

end

# this is my third-party class that `Connection` might have dependencies upon
class Service
  attr_reader :status_code

  def initialize
    @status_code = get_service_status
    # status_code would be 200, 504, 404, etc
  end

  def get_service_status
    # do complicated stuff here to get status code
    # return a status code
    200
  end
end

```

Inside my test, when I call `Connection.new.connect_to_external_service()`, I need to pass in a service object, like so:

```
srvc = Service.new
conn = Connection.new

conn.connect_to_external_service(srvc)
```

And I'm off to the races. This is where I want to start raising exceptions if either class returns errors, and where stubbing and mocking comes to be very valuable.

So, this test would pass:

```ruby
class ConnectionTest < Minitest::Test

  def test_connection_default_status_code_is_200
    c = Connection.new
    assert_equal 200, c.status_code
  end

  def test_external_service_default_status_code_is_200
    conn = Connection.new
    srvc = Service.new

    assert_equal 200, conn.connect_to_external_service(srvc)
  end
end
```

But I want to make `srvc.status_code` be something besides `200`.

Lets figure out how to make `srvc.status_code` be 404, and maybe in the process remove the dependency upon the `Service` class all together.

# Stubbing the service object to force errors

[Current github commit](https://github.com/josh-works/exception_practice/tree/dd54c0f14e3b8c5c8dff9bd1666fea8686ed718c)

Right now, I want to run a test like this:

```ruby
def test_raises_error_when_service_returns_4xx_no_mocks
  srvc = Service.new
  srvc.status_code = 404
  conn = Connection.new

  assert_raises Connection::ServiceNotFound do
    conn.connect_to_external_service(srvc)
  end
end
```

This won't work because I don't have an `attr_writer` or `attr_accessor` for the `Service` instance variable of `status_code`

This is the error I get when I run the test:

```
1) Error:
ConnectionTest#test_raises_error_when_service_returns_4xx_no_mocks:
NoMethodError: undefined method `status_code=' for #<Service:0x00007f81ce3c34d8 @status_code=200>
```

And this makes sense, right? _I cannot assume ownership of the third party service_.

Here's how I can stub out the method as I want it, using `mocha`'s tooling for stubbing:

`gem install mocha`, and include the following front-matter in the test file:

```ruby
require './lib/connection'
require 'minitest/autorun'
require 'mocha/minitest'

class ConnectionTest < Minitest::Test

  def test_raise_error_when_service_returns_4xx_using_stubs
    serv = Service.new
    # instantiating a new Service object. if I call
    # serv.status_code, it would return 200
    Service.any_instance.stubs(:status_code).returns(404)
    # override the method to always return 404
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(serv)
    end
  end
```
The magic is `Service.any_instance.stubs(:status_code).returns(404)`

_Stubbing modifies an existing object to coerce it into giving a certain output._

This is cool, but nothing revelatory to me. I've been working with stubs for a while. What finally clicked for me was the difference between _mocks_ and stubs.

The above test still requires access to a `Service` class. If Service doesn't exist, or requires any setup that I didn't pass it, I'm out of luck and will need to do _even more_ test setup.

Enter mocks.

# Mocking the service object

I want to remove _all_ dependencies on `Service`. I want to create a service object in my test, assign it variables, and use them in my `Connection` class, all without `Connection` knowing anything about `Service`, or indeed, `Service` knowing anything about itself.

We've got `Connection` under test here, remember. Not `Service`

Here's the commit for the following code: [6b7014c](https://github.com/josh-works/exception_practice/tree/6b7014cb0c2bdfefe5a7b0eae633e2f2499d4ffb)

I'll make `srvc` a `stub`, which I can now make it do _anything I want_:

```ruby
def test_rais_error_when_service_returns_4xx_using_mocks
  conn = Connection.new
  srvc = stub("srvc is now a stub.")
  # srvc.class == Mocha::Mock

  srvc.stubs(:status_code).returns(404)

  assert_raises Connection::ServiceNotFound do
    conn.connect_to_external_service(srvc)
  end
end
```
so I no longer have a `Service` object. If I call `srvc.class` on that stubbed object, it's `Mocha::Mock`

I then assign it a method of `.status_code`, and tell it to return `404`. Boom. Done.

So, I'm no longer dependent upon the `Service` model for any of my `Connection` testing. I'd say thats a win.

[Here's the commit for making full use of mocks](https://github.com/josh-works/exception_practice/blob/98850fbf764c974724fea0f280379cc07918eba9/test/connection_test.rb)

#### You'll <strike>never</strike> not necessarily see the word 'mock' in your code, even when using mocks.

I'm not the sharpest tool in the shed, so I do a lot of pattern matching. Articles about stubbing always had the word 'stub' being scattered about the code. That made it easy to see when a stub was being used.

Mocks, though, don't necessarily get called in the code. Traditionally, you could do `obj = stub('object')`, and get your stubbed object that way. Now (I think this is more recent) you can make it a bit more explicit and call `obj = mock('object')`, and you'll be on your way.

Either way, `mock()` and `stub()` are interchangeable:

```ruby
mocked_object = mock('mocked_object')
stubbed_object = stub('stubbed_object')
```

gives:

```
> mocked_object
=> #<Mock:mocked_object>
> stubbed_object
=> #<Mock:stubbed_object>
```
So, if you see `foo = mock()`, it's a mocked object, but if you see `foo = stub()`, it's _also_ a mocked object.



# Exceptions

We've covered mocking and stubbing, and are ready to dig into exception raising and handling.

Lets say my third party service goes down (404) or times out (504). I'd like to raise these descriptive errors, and do something with it.

This is the test I could create:

```ruby
def test_raise_service_timeout_if_service_returns_504
  @srv.stubs(:status_code).returns(504)

  assert_raises Connection::ServiceTimeOut do
    @conn.connect_to_external_service(@srv)
  end
end
```

And I can update my `Connection` class:

```ruby

  def connect_to_external_service(srvc)
    raise ServiceNotFound if srvc.status_code == 404
    raise ServiceTimeOut if srvc.status_code == 504
    # do other stuff
    return srvc.status_code
  end
```

This won't quite pass - for reasons I'm still exploring, we cannot raise a `ServiceTimeOut` or `ServiceNotFound` error unless these classes are included in the class:

```ruby
.
  .
  def connect_to_external_service(srvc)
    raise ServiceNotFound if srvc.status_code == 404
    raise ServiceTimeOut if srvc.status_code == 504
    # do other stuff
    return srvc.status_code
  end

  class ServiceNotFound < StandardError; end
  class ServiceTimeOut < StandardError; end
end
```

And these tests pass.

Why do we need `ServiceNotFound` and `ServiceTimeOut` to inherit from `StandardError`, _and_ be included in the class?

```
ServiceNotFound.ancestors
=> [Connection::ServiceNotFound,
 StandardError,
 Exception,
 Object,
 Kernel,
 BasicObject]
```

```
StandardError.ancestors
=> [StandardError,
 Exception,
 Object,
 Kernel,
 BasicObject]
```

`raise` is a Kernal method, [it seems](http://ruby-doc.org/core-2.5.1/Kernel.html#method-i-raise).

I'm going to leave this here, for now. The whole problem that led to this blog post I am now fully ready to dig into - I wanted to `rescue` some raised exceptions, and when I did that, the standard `assert_raises` testing stopped working, because... it seemed the raised error was caught and "squelched" by the rescue, and never bubbled back up to the test.

I'll write more on that soon.


### Misc Resources

- [Mocking and stubbing in Ruby on Rails](https://www.ibm.com/developerworks/library/wa-mockrails/)(this article is from 2007 and is the 2nd ranked result for googling `mocks stubs rails`!!!)
- [Testing Network Services in Ruby Is Easier Than You Think](https://www.justinweiss.com/articles/testing-network-services-in-ruby/)
- [Mocking in Ruby with Minitest](https://semaphoreci.com/community/tutorials/mocking-in-ruby-with-minitest)
