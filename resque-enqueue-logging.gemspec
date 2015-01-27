$:.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'lib/resque/plugins/enqueue_logging/version'

Gem::Specification.new do |s|

  s.name        = "resque-enqueue-logging"
  s.version     = "#{Resque::Plugins::EnqueueLogging::VERSION}"
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = "Resque plugin for logging info when jobs are enqueued"
  s.homepage    = "https://github.com/magoosh/resque-enqueue-logging"
  s.authors     = ["Zach Millman"]
  s.email       = "zach@magoosh.com"

  s.license     = 'MIT'
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "resque", "~> 1.25"
  s.add_development_dependency "minitest"

  s.description = 'Logs detailed info when a resque job is enqueued: "Enqueued SortUserJob to "low": user_id=1, options={"force"=>true}"'

end
