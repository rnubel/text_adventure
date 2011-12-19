# Main game loop.

require 'highline/import'
require 'reactiveai'

Dir["lib/*.rb"].each do |file|
  require file
end

# Create the world.
world = World.new
room = Room.new :description => "You stand in the middle of nowhere."
room.add_actor(Actor.new("Bob"))
room2 = Room.new :description => "You are not in the middle of nowhere. Yay."
room2.add_actor(Actor.new("Bob"))
room.exits["north"] = room2
world.player = Actor.new("Player")
world.player.current_room = room

# Loop on user's commands.
while true do
  command_str = ask("<%= color('What do you do?', BOLD + GREEN)%>")
  command = CommandParser.new(command_str).get_command
  command.execute(world)
end
