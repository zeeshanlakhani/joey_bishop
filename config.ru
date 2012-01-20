require File.join(File.expand_path(File.dirname(__FILE__)), 'environment.rb')

puts "Starting in #{Sinatra::Base.environment} mode.."

# ==============
# = App It! =
# ==============
map '/' do
  run Application
end