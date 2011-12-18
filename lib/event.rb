module Event
  module Base

  end

  class Murder
    include Base

    attr_accessor :originator, :target
    def initialize(args = {})
      @originator  = args[:originator]
      @target      = args[:target]
    end
  end
end
