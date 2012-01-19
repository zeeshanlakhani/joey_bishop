# ==========================
# = Requirement - *bundler =
# ==========================
require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

%w(base64 digest/sha2 timeout date logger ./app).each do |requirement|
	require requirement
end

# further requires (models, helpers, extensions etc)
Dir.glob('./**/*.rb') do |file|
  require file.gsub(/\.rb/, '')
end

# =====================
# = Sinatra - Configs =
# =====================
root_dir = File.dirname(__FILE__)

#server settings
Sinatra::Base.disable :run
Sinatra::Base.set :server, %w[thin mongrel webrick]

#directory settings => these are actually default to sinatra, but let's do it anyways
Sinatra::Base.set :static, true
Sinatra::Base.set :root,  root_dir
Sinatra::Base.set :public_directory, Proc.new {File.join(root, "public")}
Sinatra::Base.set :views, Proc.new {File.join(root, "views")}

#slim settings
Sinatra::Base.set :slim, :pretty => true

#helpers => can be loaded all in one call, look in /helpers/*
Sinatra::Base.helpers Logging

# ==============
# = Middleware =
# ==============
use Rack::Cache,
	:verbose => true,
	:metastore =>'heap:/',
	:entitystore =>'heap:/'

run Application
