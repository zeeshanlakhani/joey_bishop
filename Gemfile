source :rubygems

# = All =
gem 'rake'
gem 'rack'        

gem 'puma'
#backup => eventmachine
#gem 'thin'

gem 'bson_ext'
gem 'mongoid'

gem 'faraday'
gem 'faraday-stack', :require => 'faraday_stack'
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
