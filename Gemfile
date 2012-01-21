source :rubygems

# = All =
gem 'rake'
gem 'rack'        
gem 'thin'

gem 'bson_ext'
gem 'mongoid', :require => 'mongoid'

gem 'sinatra', :require => 'sinatra/base'                
gem 'sinatra-synchrony', :require => 'sinatra/synchrony'
gem 'sinatra-authentication', :require => 'sinatra-authentication'
	
gem 'rack-cache', :require => 'rack/cache'                    

gem 'slim', :require => 'slim'

gem 'faraday', :require => 'faraday'
gem 'faraday-stack', :require => 'faraday_stack'

gem 'em-synchrony', :git => "git://github.com/igrigorik/em-synchrony.git"

group :test do
	gem 'rack-test', :require => 'rack/test'
	gem 'webmock'
end

group :development do
	gem 'foreman'
    #yesness => https://github.com/alexch/rerun
	gem 'rerun'
end
