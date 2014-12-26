require 'rack/test'
require 'rspec'

require File.expand_path '../../app.rb', __FILE__

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.include RSpecMixin
end

# RSpec.configure { |c| c.include RSpecMixin }
