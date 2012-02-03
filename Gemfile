source :rubygems

# = All =
gem 'rake'
gem 'rack'        

gem 'puma'

#if mongo
gem 'bson_ext'
gem 'mongoid'

#if postgres
gem 'pg'
gem 'sequel'

gem 'faraday'
gem 'faraday_middleware'
gem 'typhoeus'
gem 'json'

gem 'resque', :require => 'resque'

gem 'sinatra', :require => 'sinatra/base'                
gem 'sinatra-authentication'
gem 'sinatra-flash', :require => 'sinatra/flash'

#rack gems here	
gem 'rack-cache', :require => 'rack/cache'  

gem 'slim'
gem 'sass'
gem 'less'

group :test do
	gem 'rack-test', :require => 'rack/test'
	gem 'webmock'
end

group :development do
    gem 'foreman'
    gem 'rerun' #yesness => https://github.com/alexch/rerun if thin
    gem 'shotgun'
end
