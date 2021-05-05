require "bundler/setup"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

load "rails/tasks/statistics.rake"

require "bundler/gem_tasks"

require "rake/testtask"
require 'webdrivers'
load 'webdrivers/Rakefile'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = Dir['test/**/*_test.rb'].reject do |path|
    path.include?('system')
  end
  t.verbose = false
end

task default: :test
