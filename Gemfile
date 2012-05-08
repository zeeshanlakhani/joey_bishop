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
#gem 'sequel'

gem 'typhoeus'
gem 'json'
gem 'dalli'

gem 'resque', :require => 'resque'

gem 'sinatra', :require => 'sinatra/base'                
gem 'sinatra-flash', :require => 'sinatra/flash'

#rack gems here	
gem 'rack-cache', :require => 'rack/cache'  
gem 'rack_csrf', :require => 'rack/csrf'  

gem 'slim'
gem 'sass'

gem 'base32'
gem 'uuidtools'

group :test do
	gem 'rack-test', :require => 'rack/test'
	gem 'webmock'
end

group :development do
	gem 'heroku'
    gem 'foreman'
    gem 'rerun' #yesness => https://github.com/alexch/rerun if thin
    gem 'shotgun'
    gem 'resque-pool'
    gem 'fl-rocco'
end

group :production do
	gem 'redis'
end
