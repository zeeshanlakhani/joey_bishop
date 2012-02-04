module Sinatra
	#lifted from https://gist.github.com/1331854/c1946a64ea9b166216f8821271952ddfdf388163
	module Loader
		def load_helpers(namespace)
			namespace.constants.each do |m|
				mod = namespace::const_get(m)
				if mod.is_a?(Module)
	  				load_helpers(mod)
	  				helpers mod
				end
			end
		end
	end
end

module Methods
	def get(url)
		return Faraday.get url
	end

	def post(url, data)
		return Faraday.post url, data
	end
end

module MyHelpers
	module Logging
		extend self
		attr_reader :log
		def log
			@log = Logger.new(STDERR)
			@log = Logger.new(STDOUT)
			@log.level = Logger::DEBUG
			return @log
		end
	end

	#faraday is a long name
	module Faraconn
		extend self
		module Conn
			extend Methods
		end
	end

	module ErrorJson
		extend self
		attr_reader :error_json
		def error_json(status, errtxt)
			log.info status
			@error_json = {'error' => "#{errtxt}", 'status' => "#{status}"}
		end
	end
end