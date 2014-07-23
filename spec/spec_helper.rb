require 'pry'
require 'time_humanizer'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.extend TimeHumanizer::TestHelper
end
