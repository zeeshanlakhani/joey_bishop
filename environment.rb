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

# =======================
# = db/offload settings =
# =======================

#resque is kinda packaged in here... and you should use it... here we go!
Resque.redis = 'localhost:6379[1]'

class Application < Sinatra::Base
	# ==============
	# = Middleware =
	# ==============
	use Rack::ShowExceptions

	use Rack::Cache,
		:verbose => true,
		:metastore =>'heap:/',
		:entitystore =>'heap:/'

	#Set Faraday adaptor + parse JSON responses
	#farday 7.6 as of this code
	Faraday.default_connection = Faraday.new do |builder|
		builder.use FaradayMiddleware::EncodeJson
		builder.use FaradayMiddleware::ParseXml,  :content_type => /\bxml$/
		builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
		builder.use Faraday::Adapter::Typhoeus
	end
	# =========================================
	# = Registrations and global Helpers here =
	# =========================================
	register Sinatra::Flash
	register Sinatra::Loader
	configure do
		load_helpers MyHelpers
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
  	set :db_config, ENV["db_config"] || 'mongo'

  	if settings.db_config.eql?('mongo')
	  	Mongoid.load!("config/mongoid.yml")
  	else
  		DB = Sequel.postgres('dev_project', :host => 'localhost')
  	end

	#directory settings
	set :static_cache_control, [:public, :max_age => 10]
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
		if defined?(Mongoid)
			Mongoid.logger = Logger.new(STDOUT)
		end

		#faraday default for dev w/logging
		Faraday.default_connection = Faraday.new do |builder|
			builder.use FaradayMiddleware::EncodeJson
			builder.use FaradayMiddleware::ParseXml,  :content_type => /\bxml$/
			builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
			builder.use Faraday::Adapter::Typhoeus
			builder.use Faraday::Response::Logger
		end
	end

	configure :test do
	end

	configure :production do
		set :sass, { :style => :compressed }
	end
end

require File.join('.', 'app.rb')
