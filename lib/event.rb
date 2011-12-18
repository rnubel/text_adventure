module Event
  module Base

  end

  class Killing
    include Base

    attr_accessor :originator, :target
    def initialize(args = {})
      @originator  = args[:originator]
      @target      = args[:target]
    end

    def ==(other)
      self.originator == other.originator &&
      self.target == other.target
    end
  end
end
