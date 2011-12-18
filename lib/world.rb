class World
  attr_accessor :player
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

  def find_actor_in_room(name, room)
    room.find_actor(name)
  end

  def do_killing(killer, victim)
    event = Event::Killing.new(
              :originator => killer,
              :target => victim
            )

    victim.current_room.occupants.each do |bystander|
      bystander.witness(event)
    end
  end
end
