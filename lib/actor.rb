class Actor
  attr_accessor :name, :reactive_self
  def initialize(name)
    @name = name

    @reactive_self = Reactive::Self.new({})
  end

  def description
    "It's #{@name}."
  end

end
