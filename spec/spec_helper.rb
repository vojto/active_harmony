require 'rubygems'
require 'webmock'
require 'mongoid'
Mongoid.configure do |config|
  name = "active_harmony_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end

require 'active_harmony'


Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :mocha
  config.include WebMock
end