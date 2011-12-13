class Room
  attr_accessor :occupants
  def initialize(args = {})
    @base_description =   args[:description]  || ""

    self.occupants =      args[:occupants]    || []
  end

  def description
    desc = @base_description

    if not occupants.empty?
      desc += "\n"
      occupants.each do |o|
        desc += "\n#{o.name} is standing here."
      end
    end

    desc
  end
end
