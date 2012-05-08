require 'bundler'
Bundler.setup
require 'rake/testtask'

require 'resque/pool/tasks'
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

namespace :app do
	desc "scss => css"
	task :scss_css do
		puts "scss => css"
		Dir.glob('public/scss/*.scss').sort_by do |file|
			exec "sass --scss #{file}:public/css/#{File.basename file, '.scss'}.css"
		end
	end
	desc "less => css"
	task :less_css do
		puts "less => css"
		Dir.glob('public/less/*.less').sort_by do |file|
			exec "lessc #{file} --include-path=public/bootstrap/less/ \
			> public/css/#{File.basename file, '.less'}.css"
		end
	end

	desc "run all rakes in namespace app"
	task :setup do
		sh %{rake app:less_css; rake app:scss_css;}
	end
end