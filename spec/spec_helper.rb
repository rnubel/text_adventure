require 'highline/import'

Dir["lib/*.rb"].each do |file|
  require File.expand_path(file)
end

RSpec.configure do |rspec|
  rspec.mock_with :mocha
end

def capture_stdout(&block)
  original_term = $terminal
  $terminal = HighLine.new($stdin, fake = StringIO.new)
  begin
    yield
  ensure
    $terminal = original_term
  end
  fake.string
end



