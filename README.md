Resque::Plugins::EnqueueLogging
===============================

A lightweight Resque plugin to log whenever a job is enqueued. Super handy for
debugging! :smile:

[![Gem Version](https://badge.fury.io/rb/resque-enqueue-logging.svg)](http://badge.fury.io/rb/resque-enqueue-logging) [![Code Climate](https://codeclimate.com/github/magoosh/resque-enqueue-logging/badges/gpa.svg)](https://codeclimate.com/github/magoosh/resque-enqueue-logging)

Installation
------------

Add to your Gemfile:

```
gem "resque-enqueue-logging"
```

Usage
-----

Just extend `Resque::Plugins::EnqueueLogging` and all the hooks will be set up.

```ruby
class SortUserJob
  extend Resque::Plugins::EnqueueLogging

  @queue = :low

  def perform(user_id, options={})
    # do hard work
  end
end

Resque.enqueue SortUserJob, 1, :force => true
```

In the logfile:
```
Enqueued SortUserJob to "low": user_id=1, options={"force"=>true}
```

TODO
----
Add tests
