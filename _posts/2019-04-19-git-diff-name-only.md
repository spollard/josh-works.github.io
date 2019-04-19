---
layout: post
title:  "VCR's debug_logger and `git diff`"
date:  2019-04-19 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [programming, git]
permalink: vcr-debug-logger-and-git-diff
---

I recently added the [vcr gem](https://github.com/vcr/vcr) to one of our repositories, and was adding tests for an external API. 

One of my tests was passing, and I wanted to commit the VCR cassette, along with the test/code that went with it. 

I had _thought_ I'd rebuilt the VCR cassette a few minutes before, but when I did `git status`, none of the expected files showed up. VCR cassettes record API calls and store them as big `.yml` files, which _should_ show up in `git status`:

![useless git status](/images/2019-02-28 at 5.31 PM.png)

This did not map to my expectation - I expected to see the VCR cassette.

## Two tools to help find the missing cassettes

First, I had to make sure the cassettes actually existed and were being used in my tests. Second, assuming the cassettes existed, I had to find them.

I checked the `test_helper.rb`, to see where the cassettes were supposed to be stashed:

```ruby
VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
```

<!--more-->

That directory location looked right. But we already _had_ a `test/fixtures/vcr_cassettes`, and it was empty. 

When I did a global find in the project for the name of the cassette I'd set, nothing came up, except for the test I was working in. 

_Where was this cassette? Did I even have VCR configured correctly?_

I opened up the [VCR docs](https://github.com/vcr/vcr#usage) to the `#usage` section, and found this line:

> *Rails and Minitest*: Do not use 'test/fixtures' as the directory if you're using Rails and Minitest (Rails will instead transitively load any files in that directory as models).

🤔

So maybe there _was_ a problem with my directory structure? 

### VCR's `debug_logger`

I googled around, and found [this useful article](https://www.rubyguides.com/2018/12/ruby-vcr-gem/), which mentioned toggling `debugger mode`, so I updated the `test_helper.rb` block for VCR, sending debug information to `$stderr`, aka my terminal:

```ruby
VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.debug_logger = $stderr # Added this line here
end
```

When I reran the test, I got lots of useful output:

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

**This request was being recorded somewhere. Where was it?**

`git status` had given me nothing. Maybe I _didn't_ delete this a while ago - maybe this was an old file that I'd committed long ago. 

## `git diff  development --name-only` to the rescue!

We all probably use `git diff` quite regularly, but I didn't want to look at _all_ of the different _lines of code_ between my current branch and development. I'd written a lot of code, and `development` had changed a lot with other people's code. I would just rebase my branch on top before finalizing the PR anyway. 

But I still wondered if I had these VCR cassettes committed in my current branch somewhere. Maybe I misunderstood where they were getting saved. 

So I ran `git diff development --name-only` It shows _just the names of the files_ that differ between the specified branch and your own branch.

I knew I'd changed about fifteen files, but when I ran the above command, I got back a list of over 100 files that had changed. 

Therefore, to further refine your results, you might want to limit the results to just the filenames on _your_ branch that differ from the comparison branch.


`git diff development...current_branch --name-only`. 

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

What had happened to my `.yml` files? The VCR configuration told the truth! They got placed in `fixtures/vcr_cassettes/`, while I was _expecting_ them to be in `test/fixtures/vcr_cassettes`. I'd committed them previously, and forgotten or never noticed that the `fixtures` directory was in the root of the application, not nested in the `test` directory.

This was a minor difference, but it took longer than I would have expected to uncover. But now I have a new tool in my git toolbox to use in the future.


### Related Resources

- [`git diff` docs](https://git-scm.com/docs/git-diff)
- [`git diff` docs, specific to `--name-only`](https://git-scm.com/docs/git-diff#git-diff---name-only)
- [How to Use The VCR Gem to Improve Your Testing Suite (RubyGuides)](https://www.rubyguides.com/2018/12/ruby-vcr-gem/)
- [VCR Gem](https://github.com/vcr/vcr#usage)