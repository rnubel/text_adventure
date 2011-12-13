class Room
  attr_accessor :description, :occupants
  def initialize(args = {})
    self.description = args[:description] || ""
    self.occupants = args[:occupants] || []
  end
end
