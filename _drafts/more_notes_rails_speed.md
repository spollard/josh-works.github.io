## Apache Benchmark

ab -t 60 http://127/0/0/1:3000/

"apache bench" tool. 

output:

```
> ab -t 60 http://127.0.01:3000/
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.01 (be patient)
Finished 2379 requests


Server Software:        WEBrick/1.3.1
Server Hostname:        127.0.01
Server Port:            3000

Document Path:          /
Document Length:        11464 bytes

Concurrency Level:      1
Time taken for tests:   60.012 seconds
Complete requests:      2379
Failed requests:        0
Total transferred:      29480568 bytes
HTML transferred:       27272856 bytes
Requests per second:    39.64 [#/sec] (mean)
Time per request:       25.226 [ms] (mean)
Time per request:       25.226 [ms] (mean, across all concurrent requests)
Transfer rate:          479.73 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0       6
Processing:    14   25  10.8     23     157
Waiting:       13   25  10.8     23     157
Total:         14   25  10.9     23     157

Percentage of the requests served within a certain time (ms)
  50%     23
  66%     26
  75%     27
  80%     28
  90%     33
  95%     41
  98%     53
  99%     69
 100%    157 (longest request)
```

the percentage chart is cool. 

Figure out how to do this in ThreatSim?

```
ab -c 10 -t 20 http://127.0.01:3000/
```

10 concurrent users

```
> ab -c 10 -t 20 http://127.0.01:3000/
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.01 (be patient)
Finished 772 requests


Server Software:        WEBrick/1.3.1
Server Hostname:        127.0.01
Server Port:            3000

Document Path:          /
Document Length:        11464 bytes

Concurrency Level:      10
Time taken for tests:   20.018 seconds
Complete requests:      772
Failed requests:        190
   (Connect: 0, Receive: 0, Length: 190, Exceptions: 0)
Non-2xx responses:      190
Total transferred:      7429314 bytes
HTML transferred:       6836778 bytes
Requests per second:    38.57 [#/sec] (mean)
Time per request:       259.302 [ms] (mean)
Time per request:       25.930 [ms] (mean, across all concurrent requests)
Transfer rate:          362.43 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.4      0       8
Processing:    34  254  60.1    242     495
Waiting:       33  249  59.7    236     495
Total:         34  254  60.1    242     495

Percentage of the requests served within a certain time (ms)
  50%    242
  66%    267
  75%    283
  80%    294
  90%    334
  95%    369
  98%    422
  99%    463
 100%    495 (longest request)
```

requests per second is important. 

## Siege

Generate a list of paths to hit:

```ruby
File.open("all_gems_urls.txt", "a+") do |file|
  Rubygem.find_each do |gem|
    file.puts "http://localhost:3000/gems/#{gem.name}"
  end
end

```
Run `siege`:

```
siege -c 32 -t 10S -f all_gems_urls.txt
```

If you get a lot of errors like:

```
[error] gzip transfer-encoding requires zlib (1056, 2908, 393216): Socket is already connected
```

The fix is as outlined [here](https://github.com/JoeDog/siege/issues/94):

```
brew uninstall siege
brew install zlib
brew install --build-from-source siege
```

That didn't work, so tried the instructions [farther down the thread](https://github.com/JoeDog/siege/issues/94#issuecomment-455023435)

```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
brew uninstall siege
brew reinstall zlib
brew install --build-from-source siege
```

I got a warning:
```
macOS has only 16K ports available that won't be released until socket
TIME_WAIT is passed. The default timeout for TIME_WAIT is 15 seconds.
Consider reducing in case of available port bottleneck.
```
but then I could run siege successfully:

![success!](/images/2019-02-04 at 9.58 AM.jpg)


-----------------------------------

# Profiling

### ruby-prof


```
RAILS_ENV=production SECRET_KEY_BASE=fkjdf ruby-prof -m0.5 --mode=cpu --printer=flat_with_line_numbers bin/rails runner "puts 'hello world'"
```

The `printer=flat_with_line_numbers` is quite interesting. This is basically profiling our start-up time, and the output looks like so:

```
Measure Mode: cpu_time
Thread ID: 70152007924060
Fiber ID: 70152012258040
Total: 13.558808
Sort by: self_time

 %self      total      self      wait     child     calls  name
  2.63      0.650     0.357     0.000     0.293    10826   Gem::Version#<=>
    defined at:
      txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/version.rb&line=342

  2.10      0.988     0.284     0.000     0.703     1932   Array#select
    called from:
      Bundler::Definition#converge_rubygems_sources (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=645)
      Bundler::Definition#converge_locals (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=603)
      Bundler::Definition#specs_for (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=234)
      <Module::Bundler::GemHelpers>#select_best_platform_match (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/gem_helpers.rb&line=46)
      Bundler::Index#search_by_dependency (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/index.rb&line=188)
      Gem::Specification#runtime_dependencies (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/specification.rb&line=2408)
      <Class::Thor>#find_command_possibilities (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor.rb&line=469)
      Rails::Paths::Path#existent (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/paths.rb&line=209)
      Rails::Initializable::Collection#tsort_each_child (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/initializable.rb&line=49)
      NewRelic::Agent::Configuration::EnvironmentSource#collect_new_relic_environment_variable_keys (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/newrelic_rpm-5.4.0.347/lib/new_relic/agent/configuration/environment_source.rb&line=109)
      <Module::NewRelic::Agent::Instrumentation::Memcache>#supported_methods_for (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/newrelic_rpm-5.4.0.347/lib/new_relic/agent/instrumentation/memcache.rb&line=28)
      Rails::Paths::Path#existent_directories (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/paths.rb&line=220)
      ActiveSupport::FileUpdateChecker#watched (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/activesupport-5.2.1/lib/active_support/file_update_checker.rb&line=102)
      MonitorMixin#mon_synchronize (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/2.3.0/monitor.rb&line=211)
      ActionDispatch::Routing::Mapper::Resources#name_for_action (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/actionpack-5.2.1/lib/action_dispatch/routing/mapper.rb&line=1789)

  1.41      0.374     0.191     0.000     0.183   124766  *Hash#[]
    called from:
      ActiveSupport::LazyLoadHooks#run_load_hooks (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/activesupport-5.2.1/lib/active_support/lazy_load_hooks.rb&line=49)
      Concurrent::Collection::NonConcurrentMapBackend#[] (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/collection/map/non_concurrent_map_backend.rb&line=19)
      Concurrent::Concern::Dereferenceable#ns_set_deref_options (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/concern/dereferenceable.rb&line=54)
      Concurrent::Delay#ns_initialize (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/delay.rb&line=158)
      <Class::Thor>#desc (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor.rb&line=54)
      <Module::Thor::Base>#register_klass_file (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor/base.rb&line=118)
      Kernel#require (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/core_ext/kernel_require.rb&
```

# ruby-prof

add the `ruby-prof` gem to your `gemfile`, and `bundle`. 

update `config.ru` to add the `use Rack` line:

```ruby
require ::File.expand_path('../config/environment', __FILE__)
use Rack::RubyProf, :path => './tmp/profile'
run Gemcutter::Application
```

go check out `/tmp/profile`