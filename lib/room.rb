class Room
  attr_accessor :description
  def initialize(args = {})
    self.description = args[:description] || ""
  end
end
