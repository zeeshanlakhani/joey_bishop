#really, a set of controllers, but is the app!
class Application < Sinatra::Base
	#scss/less to css handlers
	get '/css/:application.css' do |application|
		if !application.include? 'bootstrap'
			scss :"scss/#{application}"
		end
	end

	#main handlers
	get '/' do
		log.info "yeah index"
		@idx_header = "The Joey Bishop"
		@page_title = "The Joey Bishop Special"
		flash.now[:notice] = "good times at #{Time.now}." #=> using sinatra/flash
		slim :index, :locals => {"voo" => "funnier"} #, :layout => false if you want a diff layout
	end

	#http request w/ Faraday example
	get '/twitter' do
		status 200
		content_type :json
		resp = Faraday.get\
			"https://api.twitter.com/1/statuses/public_timeline.json?count=3&include_entities=true&trim_users=true"
		return "#{resp.body[0]}\n#{resp.body[0].class}"
	end

	#call to offload
	post '/forgive/:user' do
		status 201
		content_type :json
		Resque.enqueue(UserForgive, params['user'])
		{"foo" => "some"}.to_json
	end

	not_found do
		status 404
		slim :not_found, :locals => {"voo" => "404"}
	end

	error do

	end

end
