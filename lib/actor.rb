class Actor
  attr_accessor :name, :reactive_self, :current_room
  def initialize(name)
    @name = name

    @reactive_self = Reactive::Self.new({})
  end

  def description
    "It's #{@name}."
  end

  def move_to(room)
    current_room.remove_actor(self)
    room.add_actor(self)

    @current_room = room
  end
end
