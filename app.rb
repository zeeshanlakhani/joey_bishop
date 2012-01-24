#really, a set of controllers, but is the app!
class Application < Sinatra::Base

	#scss to css handlers

	#main handlers
	get '/' do
		log.info "yeah"
		@idx_header = "The Joey Bishop"
		@page_title = "The Joey Bishop Special"
		slim :index, :locals => {"voo" => "funnier"} #, :layout => false if you want a diff layout
	end

	get '/twitter' do
		status 200
		content_type 'application/json'
		resp = Faraday.get\
			"https://api.twitter.com/1/statuses/public_timeline.json?count=3&include_entities=true&trim_users=true"
		"#{resp.body[0]}\n#{resp.body[0].class}"
	end
end
