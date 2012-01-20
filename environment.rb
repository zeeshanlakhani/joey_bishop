Encoding.default_internal = 'UTF-8'
# ==========================
# = Requirement - *bundler =
# ==========================
require 'rubygems'
require 'bundler/setup'

Bundler.require

%w(base64 digest/sha2 timeout date logger).each do |requirement|
	require requirement
end

# further requires (models, helpers, extensions etc)
Dir.glob('./*.rb') do |file|
	require file.gsub(/\.rb/, '')
end

class Application < Sinatra::Base
	# ==================================
	# = Registrations and Helpers here =
	# ==================================
	register Sinatra::Synchrony
	register Sinatra::Loader
	configure do
		load_helpers MyHelpers
	end

	# ==============
	# = Middleware =
	# ==============

	# Set EM-Synchrony to be default drive + parse JSON responses
	Faraday.default_connection = Faraday::Connection.new do |builder|
		builder.use FaradayStack::ResponseJSON
		builder.use Faraday::Adapter::EMSynchrony 
	end

	use Rack::Cache,
		:verbose => true,
		:metastore =>'heap:/',
		:entitystore =>'heap:/'

	# ======================
	# = Sinatra - Settings =
	# ======================
	root_dir = File.dirname(__FILE__)

	#server settings
	disable :run
	set :server, %w[thin webrick]

	#directory settings => these are actually default to sinatra, but let's do it anyways
	set :static, true
	set :root,  root_dir
	set :public_directory, Proc.new {File.join(root, "public")}
	set :views, Proc.new {File.join(root, "views")}

	#cookie settings
	#enable :sessions
	#set :session_secret, "OH"

	#slim settings
	set :slim, :pretty => true

	#app based configurations
	configure :development do
		puts "fun_times_had_by_all"
	end

	configure :test do
	end

	configure :production do
	end
end

require File.join('.', 'app.rb')