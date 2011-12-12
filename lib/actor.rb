class Actor
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def description
    "It's #{@name}."
  end

end
