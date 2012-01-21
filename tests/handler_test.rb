require File.join File.expand_path(File.dirname(__FILE__)), 'test_environment.rb'

describe Application do
  include Rack::Test::Methods
  def app; Application end

  describe 'the index route' do
    it 'should load correctly' do
		get '/'
		last_response.ok?.must_equal true
		last_response.status.must_equal 200
		last_response.headers["Content-Type"].must_equal "text/html;charset=utf-8"
    end
  end
end
