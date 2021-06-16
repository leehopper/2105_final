class Train
  attr_reader :name, :type, :cargo

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @cargo = {}
  end
end
