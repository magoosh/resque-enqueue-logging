require "rubygems"
require "resque"

$:.unshift(File.expand_path(File.dirname(__FILE__)) + '/../lib')

require "resque_enqueue_logging"
