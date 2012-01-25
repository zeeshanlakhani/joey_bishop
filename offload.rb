#resque offloads
module UserForgive
	@queue = :default
	def self.perform(user)
		sleep 1
  		puts "Forgive #{user}!"
	end
end