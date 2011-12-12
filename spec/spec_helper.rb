Dir["lib/*.rb"].each do |file|
  require File.expand_path(file)
end

RSpec.configure do |rspec|
  rspec.mock_with :mocha
end
