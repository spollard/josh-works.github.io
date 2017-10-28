---
layout: post
title:  "First pass with Elixir/Phoenix"
date:   2017-10-27 01:18:52 -0600
crosspost_to_medium: false
categories: [programming]
tags: [elixir, programming, phoenix]
permalink: first-pass-elixir-phoenix
---

I'm digging into Elixir and Phoenix. I'm working through [this tutorial to cloning Slack](https://medium.com/@benhansen/lets-build-a-slack-clone-with-elixir-phoenix-and-react-part-1-project-setup-3252ae780a1).

The tutorial author says

> At the time of writing, I have ~1 week experience with Phoenix. Similar to [Rubber Ducky Debugging](https://www.wikiwand.com/en/Rubber_duck_debugging), I am writing this blog post to force myself to think differently about the problems I am solving and therefore gain a better understanding of the language and framework.

Couldn't agree more myself. This post serves as *my* Rubber Ducky Debugging process for getting started with Elixir/Phoenix.

Similar to the author, I come from a Ruby/Rails background, but undoubtedly less experienced than the author. So, this article will capture tidbits and pieces useful to me as I work through the tutorial.

I'm [intentional in how I learn]({{ site.baseurl }}{% link _posts/2017-06-04-learning-how-to-learn.md %}), as well as in [how I ask questions]({{ site.baseurl }}{% link _posts/2017-05-29-ask-better-questions.md %}), so this is just me, doing what I do, to learn things.

Onward!

# Installing Elixir and Phoenix

Installation is super easy.

The recommended tutorials + some clicking around was all I needed. Brew handled most of it, and [elixir-lang's installation guide](https://elixir-lang.org/install.html) pairs well with [the same for phoenix](https://hexdocs.pm/phoenix/installation.html)

I just `cd`'ed into `workspace/elixir` (where my otherwise homeless bits of code lives) and test-drove Phoenix's equivalent of `rails new`. I'm taking a quick detour through [this guide](https://hexdocs.pm/phoenix/up_and_running.html) at the moment.

<!--more-->

`$ mix phx.new hellow` gives us a bunch of output, and eventually a new project.

(I tend to intentionally misspell variables and such when following tutorials - helps me detangle the language/framework's nomenclature from my own, and tunes me in a bit closer to ways to make errors. So, this project is named "hellow", and any further code snippets will reflect that. Be wary, this strategy has led me into more than a little debugging as I walk through tutorials. But I come out stronger on the other end...)

The directory structure looks familiar:

```
.
├── README.md
├── _build
├── assets
├── config
├── deps
├── lib
├── mix.exs
├── mix.lock
├── priv
└── test
```

`deps` is foreign to me, though. Inside of that directory is a bunch of other directories, all looking greek to me.

Poking around a bit, I'm seeing files with `.ex` and `.exs` extensions. [StackOverflow](https://stackoverflow.com/questions/36292620/elixir-when-to-use-ex-and-when-exs-files) says `.ex` is for "compiled" Elixir code, while `.exs` is "scripting" Elixir code. Elixir is my first brush with a functional programming language, which is *also* my first exposure to compiled languages, so I'm putting a flag in this as Significant.

Ah, and `.eex` is "embedded Elixir", or in my Rails-centric background "elixir's version of embedded ruby/.erb". Good, because no one wants to write raw HTML.

If Elixir doesn't have some version of `pry`, I'm going to be sad.

Per the instructions, `$ mix ecto.create`, a few missing dependencies (say `Y`), and

```
=> The database for Hellow.Repo has been created
```

Wahoo.

`$ mix phx.server` seems to be `rails server`. So handy having a mental framework to hang new info on.

A quick check of `localhost:4000` and we're in business:

![terminal goodies + localhost](/images/2017-10-27-elixir_01.jpg)

On to [part 2](https://hexdocs.pm/phoenix/adding_pages.html) of the intro guide:

The writeup mentions that most of our work will live in the `/lib` directory

Lots of interesting stuff that seems quite familiar after working with a MVC model, but we'll dig into it all later.

# Routes

Ah, routes. Makes me nostalgic for `config/routes.rb`

Elixir's equivalent lives in `hellow/lib/hellow_web/router.ex`, which we know is a compiled file (I think?).

By default, it looks pretty manageable:

```elixir
defmodule HellowWeb.Router do
  use HellowWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HellowWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

end
```

As soon as seeing the reference to PageController, I had to see if there was an associated test.

Ah, software. It even reads just like RSpec. :)

```elixir
# test/hellow_web/controllers/page_controller_test.exs

defmodule HellowWeb.PageControllerTest do
  use HellowWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
```

## Testing

_We interrupt current programming to figure out how to run tests in Elixir_

Looks like `Mix` is an Elixir build tool. We'll be using it a lot.

`ExUnit` seems to be Elixir's test-unit framework. AKA RSpec/Minitest. ([source](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html))

And [tests](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html#running-tests)

Looks like `$ mix test` does it.

Holy cow... There's a ton of deprecation warnings and the test took ages. (Er, it passed by the way. )

Looks like this is a [new and fixed issue](https://www.bountysource.com/issues/43427732-fix-elixir-1-5-deprecation-warnings), so the recommended fix is to use a more recent version of [poison](https://github.com/devinus/poison).

Jumping into `mix.exs` (aka Rail's `Gemfile`), adding the newest version of poison:

```elixir
defp deps do
    [
      {:poison, "~> 3.1"},
      {:phoenix, "~> 1.3.0"},
      .
      ]
end
```
and updating dependencies:

`$ mix deps.get`

and lets run the tests again:

`$ mix test`

Ah, lovely. No more dependency problems.

Two other notable events, though - I think the first time I ran the tests, Mix had a ton of compiling to do.

This is the output from the first test run:

```bash
# all of the many deprecation warnings removed
==> connection
Compiling 1 file (.ex)
Generated connection app
==> gettext
Compiling 1 file (.erl)
Compiling 20 files (.ex)
Generated gettext app
===> Compiling ranch
===> Compiling poolboy
==> decimal
Compiling 1 file (.ex)
Generated decimal app
==> poison
Generated poison app
==> db_connection
Compiling 23 files (.ex)
Generated db_connection app
==> phoenix_pubsub
Compiling 12 files (.ex)
Generated phoenix_pubsub app
===> Compiling cowlib
===> Compiling cowboy
==> mime
Compiling 1 file (.ex)
Generated mime app
==> plug
Compiling 1 file (.erl)
Compiling 44 files (.ex)
Generated plug app
==> phoenix_html
Compiling 8 files (.ex)
Generated phoenix_html app
==> phoenix
Compiling 74 files (.ex)
Generated phoenix app
==> postgrex
Compiling 62 files (.ex)
Generated postgrex app
==> ecto
Compiling 70 files (.ex)
Generated ecto app
==> phoenix_ecto
Compiling 6 files (.ex)
Generated phoenix_ecto app
==> hellow
Compiling 16 files (.ex)
Generated hellow app
....

Finished in 0.1 seconds
4 tests, 0 failures

Randomized with seed 769269
```

The second time I ran it, not only were there no deprecation warnings, there was basically no set-up:

```bash
mix test
Compiling 16 files (.ex)
Generated hellow app
....

Finished in 0.06 seconds
4 tests, 0 failures

Randomized with seed 608206
```

OK, again, I feel like all the setup steps are Significant, but don't yet know why.

Onward!

## Back to Routes/Routing

Lets add:

```elixir
scope "/", HellowWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HellowController, :index # Adding this bad boy
  end
```

When visiting `localhost:4000/hello`, we get a very Rails-esque error code, saying "I cannot find the controller you're asking for". Which is great, because `HellowController` doesn't exist.

### A new Controller

Jumping in to make a new controller file moves us along in error-driven development (EDD):

```elixir
# lib/hellow_web/controllers/hellow_controller.ex
defmodule HellowWeb.HellowController do
  use HellowWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
```

And we get:
```
UndefinedFunctionError at GET /hello
function HellowWeb.HellowView.render/2 is undefined (module HellowWeb.HellowView is not available)
```

Perfect. We are (I suspect) calling a non-existent file to render stuff to the browser. Phoenix complains.

### A new View

I put together a quick view, templated off an existing view, and for the first time my MVC background failed me. I assumed views would be for presentation, but it seems like Views in Phoenix are more analagous to Models in Rails.

There's a `/templates` directory that contains presentation-related data, so I'll just run with "view == models" for now.

> Phoenix views have several important jobs. They render templates. They also act as a presentation layer for raw data from the controller, preparing it for use in a template. Functions which perform this transformation should go in a view. ([hexdocks](https://hexdocs.pm/phoenix/adding_pages.html#a-new-view))


### Templates


Ah, interesting. As soon as I created `lib/hellow_web/templates/hellow/index.html.eex`, the errors in Mix went away, and I'm now loading an empty page.

(Even though the file is empty)

So, Phenix has live code-reloading (when I made the file, I saw the logs from `mix phx.server` show compiling and rendering data. The red went away.)

Also, the view is obviously embedded inside of an application layout, because the header/footer/things-that-make-HTML-work-on-the-internet kicked in and rendered my three lines of HTML.

A quick peek at `lib/hellow_web/templates/layout/app.html.eex`, and it's almost indistinguishable from `app/views/layouts/application.html.erb` in Rails.

### A second new page

The universally sound advice for education and training applies here quite well:

> Do it again, faster




_this is a WIP. I'll expand this or split it into a few more posts over the coming few days._
