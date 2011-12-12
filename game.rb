# Main game loop.

require 'highline/import'

Dir["lib/*.rb"].each do |file|
  require file
end

# Create the world.
world = World.new

# Loop on user's commands.
while true do
  command_str = ask("What do you do?")
  command = CommandParser.new(command_str).get_command
  command.execute(world)

end
