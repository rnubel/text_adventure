class World
  attr_accessor :current_room
  def initialize
    @actors = []
  end

  def add_actor(actor)
    @actors.push(actor)
  end

  def find_actor(name)
    @actors.find do |actor| 
      actor.name == name
    end
  end

  def find_actor_in_room(name)
    current_room.find_actor(name)
  end
end
