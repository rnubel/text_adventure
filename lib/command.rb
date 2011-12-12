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
  end
end

class Command::Look
  include Command::Base

  def execute(world)
    say(world.find_actor(@target).description)
  end
end

class Command::Kill
  include Command::Base
end

class Command::Unknown
  def execute(world)
    say "You don't know how to do that."
  end
end

class Command::Exit
  def execute(world)
    exit(1) if agree("Are you sure? [y/n]")
  end
end
