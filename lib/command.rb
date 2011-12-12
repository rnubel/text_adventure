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
end

class Command::Kill
  include Command::Base
end
