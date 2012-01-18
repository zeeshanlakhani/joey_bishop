require 'bundler/setup' # gem requires

Bundler.require(:default, ENV['RACK_ENV'].to_sym)  # only loads environment specific gems
# core Ruby requires, modules and the main app file
%w(base64 digest/sha2 timeout date ./app).each do |requirement|
	require requirement
end

# ==============
# = Middleware =
# ==============
use Rack::Cache,
	:verbose => true,
	:metastore =>'heap:/',
	:entitystore =>'heap:/'

run App.new
