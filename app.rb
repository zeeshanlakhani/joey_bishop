class App < Sinatra::Base
	#configurations
	configure do
    	set :app_file, __FILE__
    	set :run, false
    	set :server, %w[thin webrick]
    	set :slim, :pretty => true
	end

	#register Sinatra::Synchrony
	get '/' do
		slim :index
	end
end
