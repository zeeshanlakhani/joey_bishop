#really, a set of controllers, but is the app!
class Application < Sinatra::Base
	#handlers
	get '/' do
		log.info "The summer wind came blowin' in"
		@idx_header = "The Joey Bishop"
		@page_title = "The Joey Bishop Special"
		slim :index #, :layout => false if you want a diff layout
	end

	get '/twitter' do
		status 200
		content_type 'application/json'
		resp = Faraday.get\
			"https://api.twitter.com/1/statuses/public_timeline.json?count=3&include_entities=true&trim_users=true"
		"#{resp.body[0]}\n#{resp.body[0].class}"
	end
end
