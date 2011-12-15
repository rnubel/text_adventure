class Room
  attr_accessor :occupants, :exits
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

  def find_actor(name)
    occupants.find { |o| o.name == name }
  end

  def add_actor(actor)
    occupants.push(actor)
  end

  def remove_actor(actor)
    occupants.delete(actor)
  end
end
