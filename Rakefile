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
	exec 'rerun -p "**/*.{rb,js,css,scss,sass,erb,html,haml,ru,coffee,slim,less}" -- bundle exec rackup --port 8888 config.ru'
end

desc "less => css"
task :less_css do
	sh %{cd public/bootstrap/less; lessc bootstrap.less > ../../../public/css/bootstrap.css}
	Dir.glob('public/less/*.less') do |file|
		exec 'lessc #{file} > public/css/#{file}.css'
	end
end