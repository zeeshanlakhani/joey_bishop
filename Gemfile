source :rubygems

# = All =
gem 'rake'
gem 'rack'        

gem 'puma'

#backup => eventmachine
#gem 'thin'

gem 'httparty'

gem 'bson_ext'
gem 'mongoid'

gem 'sinatra', :require => 'sinatra/base'                
gem 'sinatra-authentication'

#rack gems here	
gem 'rack-cache', :require => 'rack/cache'   

gem 'slim'
gem 'sass'

group :test do
	gem 'rack-test', :require => 'rack/test'
	gem 'webmock'
end

group :development do
	gem 'foreman'
    gem 'rerun' #yesness => https://github.com/alexch/rerun if thin
    gem 'shotgun' #if using puma
end

#tbd => synchrony
#gem 'sinatra-synchrony', :require => 'sinatra/synchrony'
#gem 'em-synchrony'
#gem 'em-http-request'
#gem 'rack-fiber_pool'
#gem 'em-resolv-replace'

#tbd => faraday
#gem 'faraday'
#gem 'faraday-stack', :require => 'faraday_stack'