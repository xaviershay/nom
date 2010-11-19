$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
ENV["PATH"] = [File.expand_path("../../bin", __FILE__), ENV["PATH"]].join(':')

require 'nom'

RSpec.configure do |config|
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  config.mock_with :rr
end

require File.expand_path('../be_numbered', __FILE__)
