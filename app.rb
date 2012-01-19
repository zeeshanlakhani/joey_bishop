class Application < Sinatra::Base
	get '/' do
		log.info "The summer wind came blowin' in"
		slim :index
	end

end