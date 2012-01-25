require 'bundler'
Bundler.setup
require 'rake/testtask'

require 'resque/tasks'
require File.join(File.expand_path(File.dirname(__FILE__)), 'offload.rb')

desc "Run all tests"
Rake::TestTask.new do |t|
  t.libs << "tests"
  t.test_files = FileList['tests/*_test.rb']
  t.verbose = true
end

desc "Start it up!"
task :singit do 
	exec 'rerun -p "**/*.{rb,js,css,scss,sass,erb,html,haml,ru,coffee,slim}" -- bundle exec rackup --port 8888 config.ru'
end