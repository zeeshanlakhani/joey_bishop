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
			
			if defined?(Mongoid)
				Mongoid.logger = Logger.new(STDOUT)
			end
			return @log
		end
	end
end