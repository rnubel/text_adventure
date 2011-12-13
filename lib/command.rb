module Command
  module Base
    attr_accessor :target 
    def initialize(target=nil)
      @target = target
    end

    def ==(other)
      self.target == other.target
    end

    def execute(world)
    end

    def output(str)
      say(HighLine::color(str, :yellow))
    end
  end
end

class Command::Look
  include Command::Base

  def execute(world)
    if @target then # Look at something
      actor = world.find_actor_in_room(@target)
      output(actor ? actor.description : "You don't see anyone like that.")
    else
      room = world.current_room
      output(room ? room.description : "You don't appear to be anywhere particular.")
    end
  end
end

class Command::Kill
  include Command::Base
end

class Command::Unknown
  def execute(world)
    output "You don't know how to do that."
  end
end

class Command::Exit
  def execute(world)
    exit(1) if agree(HighLine::color("Are you sure? [y/n]", HighLine::BOLD + HighLine::GREEN))
  end
end
