---
layout: post
title:  "Handling Exceptions in Ruby"
date:  2018-05-18 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [ruby, rails, exceptions]
permalink: handling-exceptions-in-ruby
---

Some of my recent work at Wombat has been around improving error handling and logging.

We had some tasks that, if they failed to execute correctly, were _supposed_ to raise exceptions, log themselves, and re-queue, but they were not.

There's some nuance and subtlety to handling exceptions in Ruby (and Rails), and I was having trouble getting the tests just right, so I could both `raise` a certain exception (and test that this error was raised), but then also `rescue` the raised exception.

As I often do, I spun up a bare-bones implementation of all of the required pieces, to see how everything was playing together.

This project took me through:
- stubbing
- mocking
- raising exceptions
- rescuing exceptions
- testing all of the above

# Eliminate dependencies on other classes in testing

I'm making up this `service` and `connection` class.

Imagine I want to connect to a few different third-party services. I'll have a `connection` class into which I can pass a third-party service object, and it should "connect".

<!--more-->

I will assume I can call `third_party_service.status` and get back `200`, `404`, `504`, etc.

I will also assume that sometimes my own service will not function correctly, and so `connection.status` can also be any particular status code, like `200`, `404`, `504`, etc.

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

Now, lets say I've got this third party service. Since I'm testing this all locally, I've put it in the same file as my `Connection` class:

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

When I call `Connection.new.connect_to_external_service()`, I need to pass in a service object, like so:

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

# Stubbing the service object

Commit of basic framework: `dd54c0f`

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

Here's how I can stub out the method as I want it, using `mocha`'s tooling for stubbing:

```ruby
  def test_raise_error_when_service_returns_4xx_using_stubs
    serv = Service.new
    # instantiating a new Service object. if I call
    # serv.status_code, it would return 200
    Service.any_instance.stubs(:status_code).returns(404)
    # over-rides the method to always return 404
    conn = Connection.new

    assert_raises Connection::ServiceNotFound do
      conn.connect_to_external_service(serv)
    end
  end
```

This is cool, but nothing revelatory to me. I've been working with stubs for a while. What finally clicked for me was the difference between _mocks_ and stubs.

The above test still requires access to a `Service` class. If Service doesn't exist, or requires any setup that I didn't pass it, I'm out of luck and will need to do _even more_ test setup.

Enter mocks.

# Mocking the service object

I want to remove _all_ dependencies on `Service`. I want to create a service object in my test, assign it variables, and use them in my `Connection` class, all without `Connection` knowing anything about `Service`, or indeed, `Service` knowing anything about itself.

We've got `Connection` under test here, remember. Not `Service`.

git commit of example: `6b7014c`

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

Commit of clean tests: e0f8a96

So, I'm no longer dependent upon the `Service` model for any of my `Connection` testing. I'd say thats a win.


# Exceptions

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

This won't quite pass - for reasons I'm still exploring, we cannot raise a `ServiceTimeOut` or `ServiceNotFound` error unless these objects are included in the class:

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

`raise` is a Kernal method, it seems.


There's a few pieces you'll need in place to set up good testing grounds:

- Some tests (of course)
- Mocha, so you can stub stuff out
- A few classes where you can introduce errors


### Misc Issues I ran into

- stubs vs. mocks (still unclear)


### Misc Resources

- [](https://www.ibm.com/developerworks/library/wa-mockrails/)
- [](https://www.justinweiss.com/articles/testing-network-services-in-ruby/)
