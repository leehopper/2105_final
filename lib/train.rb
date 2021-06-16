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

  def count_cars(car)
    if @cargo.has_key?(car)
      @cargo[car]
    else
      0
    end
  end

  def weight
    @cargo.sum do |train, num|
      train.weight * num
    end 
  end
end
