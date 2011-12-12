module Command
  module Base
    attr_accessor :target 
    def initialize(target=nil)
      @target = target
    end

    def ==(other)
      self.target == other.target
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
