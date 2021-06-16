class Train
  attr_reader :name, :type, :cargo

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @cargo = {}
  end

  def add_cars(car, num)
    if @cargo.has_key?(car)
      @cargo[car] += num
    else
      @cargo[car] = num
    end
  end
end
