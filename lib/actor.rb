class Actor
  attr_accessor :name, :reactive_self, :current_room
  def initialize(name)
    @name = name

    @reactive_self = Reactive::Self.new({})
    @actor_entities = {}
  end

  def description
    "It's #{@name}."
  end

  def move_to(room)
    current_room.remove_actor(self)
    room.add_actor(self)

    @current_room = room
  end

  def move_in_direction(direction)
    if current_room.exits.has_key? direction
      move_to current_room.exits[direction]
    end
  end

  def witness(event)
    # Convert the game event to a reactive action.
    action = get_action_for(event)
    reactive_self.react_to!(action)

    puts "#{self.name} says \"Wtf?\""
  end

  private
  def get_entity_for(actor)
    return nil if actor.nil?
    @actor_entities[actor] ||= Reactive::Entity.new(:name => actor.name)
  end

  def get_action_for(event)
    case
    when event.class == Event::Killing
      src = get_entity_for(event.originator)
      dst = get_entity_for(event.target)
      Reactive::Actions::Murder.new(:source => src, :destination => dst)
    else
      nil
    end

  end
end
