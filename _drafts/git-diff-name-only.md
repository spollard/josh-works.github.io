---
layout: post
title:  "git diff --name-only"
date:  2019-02-28 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, git]
permalink: git-diff-name-only
---

I recently added the [vcr](https://github.com/vcr/vcr) gem to one of our repositories, and was adding some tests for an external API. 

One of my tests was passing, and I wanted to commit the vcr cassette, along with the test/code that went with it. 

I had _thought_ I'd rebuilt the VCR cassette a few minutes before, but when I did `git status`, nothing showed up:

![useless git status](/images/2019-02-28 at 5.31 PM.png)

This did not map to my expectation.

So, I checked our `test_helper`, to see where the cassetts were supposed to be stashed:

```ruby
VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
```

<!--more-->

That directory location looked right. But we already _had_ a `test/fixtures/vcr_cassettes`, and it was empty. 

When I did a global find in the project for the name of the cassette I'd set, nothing came up, except for the test I was working in. 

_where the heck was this cassette_? Did I even have VCR configured correctly?

I opened up the [vcr docs](https://github.com/vcr/vcr#usage) to the `#usage` section, and found this line:

> *Rails and Minitest*: Do not use 'test/fixtures' as the directory if you're using Rails and Minitest (Rails will instead transitively load any files in that directory as models).

🤔

So maybe there _was_ a problem with my directory structure? 

I googled around, and found [this useful article](https://www.rubyguides.com/2018/12/ruby-vcr-gem/), which mentioned toggling `debugger mode`, so I updated the `test_helper.rb` block for VCR:

```ruby
VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.debug_logger = $stderr # Added this line here
end
```

Reran the test, and got lots of useful output:

```
# the following's been anonymized a bit
[Cassette: 'external_service_fetch_token'] Initialized with options: {:record=>:once, :match_requests_on=>[:method, :uri], :allow_unused_http_interactions=>true, :serialize_with=>:yaml, :persist_with=>:file_system}
[webmock] Handling request: [post https://service.com/give-me-a-token] (disabled: false)
[Cassette: 'external_service_fetch_token'] Initialized HTTPInteractionList with request matchers [:method, :uri] and 1 interaction(s): { [post https://service.com/give-me-a-token] => [200 "{\n  \"access_token\" : \"aaabbbcccddd"] }
[Cassette: 'external_service_fetch_token'] Checking if [post https://service.com/give-me-a-token] matches [post https://service.com/give-me-a-token] using [:method, :uri]
[Cassette: 'external_service_fetch_token'] method (matched): current request [post https://service.com/give-me-a-token] vs [post https://service.com/give-me-a-token]
[Cassette: 'external_service_fetch_token'] uri (matched): current request [post https://service.com/give-me-a-token] vs [post https://service.com/give-me-a-token]
[Cassette: 'external_service_fetch_token'] Found matching interaction for [post https://service.com/give-me-a-token] at index 0: [200 "{\n  \"access_token\" : \"aaabbbcccddd"]
[webmock] Identified request type (stubbed_by_vcr) for [post https://service.com/give-me-a-token]
```

**This request was being recorded somewhere. Where the heck was it?**

`git status` had given me nothing. Maybe I _didn't_ delete this a while ago - maybe this was an old file that I'd committed long ago. 

`git diff` for the rescue. We all probably use it with some regularity, but I didn't want to look at _all_ of the diffs between my current branch and development. I'd written a lot of code, and `development` had changed a lot with other people's code. I'd rebase my branch on top before finalizing the PR anyway. 

`git diff development --name-only` is what I used. It shows _just the names of the files_ that have a diff between the current branch and development. 

Here's the output I got:

```
threatsim/Gemfile
threatsim/Gemfile.lock
threatsim/app/controllers/api/external_service/things_controller.rb
threatsim/app/models/external_service_token_validator.rb
threatsim/config/routes.rb
threatsim/fixtures/vcr_cassettes/external_service_expired_token.yml
threatsim/fixtures/vcr_cassettes/external_service_generate_token.yml
threatsim/fixtures/vcr_cassettes/external_service_token_validation.yml
threatsim/test/controllers/api/external_service/things_controller_test.rb
threatsim/test/models/external_service_token_validator_test.rb
threatsim/test/test_helper.rb
```

Boom. Those `*.yml` files are what I needed. 

I'd been on a long goose chase because I didn't think to run this command any earlier. 

So, to recap:

```
git diff development --name-only
# git diff <branch_you_want_to_compare_against> --name-only
```

### Related Resources

- [`git diff` docs](https://git-scm.com/docs/git-diff)
- [`git diff` docs, specific to `--name-only`](https://git-scm.com/docs/git-diff#git-diff---name-only)
- [How to Use The VCR Gem to Improve Your Testing Suite (RubyGuides)](https://www.rubyguides.com/2018/12/ruby-vcr-gem/)
- [VCR Gem](https://github.com/vcr/vcr#usage)