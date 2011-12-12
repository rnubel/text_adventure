class CommandParser
  def initialize(string)
    @args = string.split(" ")
  end

  def get_command
    action_name = @args[0]

    case action_name
    when 'look'
      return Command::Look.new(@args[1])
    when 'kill'
      return Command::Kill.new(@args[1])
    end
  end


end


