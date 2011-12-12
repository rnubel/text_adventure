# Main game loop.

require 'highline/import'

Dir["lib/*.rb"].each do |file|
  require file
end

# Create the world.
world = World.new
room = Room.new :description => "You stand in the middle of nowhere."
world.current_room = room

# Loop on user's commands.
while true do
  command_str = ask("<%= color('What do you do?', BOLD + GREEN)%>")
  command = CommandParser.new(command_str).get_command
  command.execute(world)
end
