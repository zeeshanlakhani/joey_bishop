#encodings working in rubinius with ruby 1.9, still being developed though
Encoding.default_internal = 'UTF-8'
# ==========================
# = Requirement - *bundler =
# ==========================
require 'rubygems'
require 'bundler/setup'

Bundler.require

%w(base64 digest/sha2 timeout date logger yaml).each do |requirement|
	require requirement
end

# further requires (models, helpers, extensions etc)
Dir.glob('./*.rb') do |file|
	require file.gsub(/\.rb/, '')
end

class Application < Sinatra::Base
	# ==============
	# = Middleware =
	# ==============
	use Rack::ShowExceptions

	# use Rack::Cache,
	# 	:verbose => true,
	# 	:metastore =>'heap:/',
	# 	:entitystore =>'heap:/'

	use Rack::Deflater
	use Rack::Session::Cookie, :secret => ENV['COOKIESECRET'] || "hello joey", :expire_after => 1200, :key => 'joeybishop'
	use Rack::Csrf, :raise => true

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
  	set :protection, :except => [:remote_token, :frame_options] 

  	#db/offload settings
  	if settings.db_config.eql?('mongo')
	  	Mongoid.load!("config/mongoid.yml")
  	else
  		#PostDB = Sequel.postgres('dev_project', :host => 'localhost', :user => 'user', :password => 'password', :port => 1234)
  	end

  	#resque is kinda packaged in here... and you should use it... here we go!
	config = YAML::load(File.open("config/redis.yml"))["#{Sinatra::Base.environment}"]
	Resque.redis = Redis.new(:host => config['host'], :port => config['port'])

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

		if defined?(PostDB)
			PostDB.loggers << Logger.new(STDOUT)
		end
	end

	configure :test do
	end

	configure :production do
		#compressions
		set :sass, { :style => :compressed }
	end
end

require File.join('.', 'app.rb')
