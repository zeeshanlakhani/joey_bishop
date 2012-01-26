#encodings working in rubinius with ruby 1.9, still being developed though
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

# ====================
# = general settings =
# ====================
Resque.redis = 'localhost:6379[2]'

class Application < Sinatra::Base
	# =========================================
	# = Registrations and global Helpers here =
	# =========================================
	register Sinatra::Flash
	register Sinatra::Loader
	configure do
		load_helpers MyHelpers
	end

	# ==============
	# = Middleware =
	# ==============
	use Rack::ShowExceptions

	use Rack::Cache,
		:verbose => true,
		:metastore =>'heap:/',
		:entitystore =>'heap:/'

	# Set Faraday adaptor + parse JSON responses
	Faraday.default_connection = Faraday::Connection.new do |builder|
		builder.use FaradayStack::ResponseJSON
		builder.use Faraday::Adapter::Typhoeus
	end

	# ======================
	# = Sinatra - Settings =
	# ======================
	#server settings
	disable :run

	root_dir = File.dirname(__FILE__)

	#options
	set :raise_errors,    false
  	set :show_exceptions, false

	#directory settings
	set :static_cache_control, [:public, :max_age => 300]
	set :root,  root_dir
	set :public_folder, 'public'
	set :views, 'views'

	#cookie settings
	enable :sessions
	#set :session_secret, "OH"

	#slim settings
	set :slim, :pretty => true
	set :slim, :sections => false

	#app based configurations
	configure :development do
		puts "fun_times_had_by_all"
	end

	configure :test do
	end

	configure :production do
		set :sass, { :style => :compressed }
	end
end

require File.join('.', 'app.rb')
