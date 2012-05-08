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

	module RandGen
		extend self
		attr_reader :rand_id
		def gen_random_id()
			@rand_id = Base32.encode(Digest::MD5.digest(UUIDTools::UUID.random_create)).downcase!.split('=')[0]
		end
	end

	module RandString
		extend self
		attr_reader :rand_string
		def randstring(length)
			chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
			@rand_string = chars.sort_by { rand }.join[0...length]
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

	#more generic helpers
	module IsNumeric
		def is_numeric?(obj) 
		   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
		end
	end

	module UserAgentMobileCheck
		def isMobile(req_agent)
			ua = AgentOrange::UserAgent.new(req_agent)
			plat = @ua.device.platform.to_s.downcase
			if ua.is_mobile? and plat.index('ipad').nil? and !req_agent.downcase.index('mobile').nil? and req_agent.downcase.index('tablet').nil?
				return true
			else
				return false
			end
		end
	end

	module CSRF
		def csrf_token()
			Rack::Csrf.csrf_token(env)
		end

		def csrf_tag()
			Rack::Csrf.csrf_tag(env)
		end
	end
end