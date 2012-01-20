require File.join File.expand_path(File.dirname(__FILE__)), 'test_environment.rb'

describe Application do
  include Rack::Test::Methods
  def app; Application end

  describe 'the index route' do
    it 'should load correctly' do
		get '/'
		last_response.ok?.must_equal true
		last_response.status.must_equal 200
    end
  end
end
