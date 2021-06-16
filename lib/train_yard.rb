class TrainYard
  attr_reader :trains

  def initialize(attribute)
    @location = attribute[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    types = @trains.map do |train|
      train.type
    end.uniq
    types.sort
  end

  def trains_containing(car)
    @trains.select do |train|
      train.cargo.keys.include?(car)
    end
  end

  def sorted_cargo_list
    cargo = @trains.flat_map do |train|
      train.cargo.keys.map do |car|
        car.type
      end
    end.uniq
    cargo.sort
  end

  def cars_in_yard
    @trains.flat_map do |train|
      train.cargo.keys
    end.uniq
  end

  def total_inventory
    inventory = {}
    cars_in_yard.each do |car|
      @trains.each do |train|
        if inventory.has_key?(car)
          inventory[car] += train.count_cars(car)
        elsif train.count_cars(car) > 0
          inventory[car] = train.count_cars(car)
        end
      end
    end
    inventory
  end
end
