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