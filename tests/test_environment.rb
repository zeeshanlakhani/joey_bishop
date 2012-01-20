ENV['RACK_ENV'] = 'test'
raise 'Forget it.' if ENV['RACK_ENV'] == 'production'
require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'environment.rb')
Bundler.require :test
require 'minitest/autorun'
require 'webmock'
require 'webmock/http_lib_adapters/em_http_request/em_http_request_1_x'

def mock_app(base=Sinatra::Base, &block); @app = Sinatra.new(base, &block) end
def app=(new_app); @app = new_app end

include WebMock::API