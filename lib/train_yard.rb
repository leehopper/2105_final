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
      cars_in_yard.map do |car|
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

  def overflow_cars
    big_cars = total_inventory.select do |car, num|
      num >= 10
    end.keys
    big_cars.select do |car|
      trains_containing(car).length > 1
    end
  end

  def unload(car, quantity)
    if total_inventory[car] >= quantity
      to_remove = quantity
      trains_containing(car).each do |train|
        if to_remove > 0 && train.count_cars(car) < to_remove
          to_remove -= train.cargo[car]
          train.cargo[car] = 0
        elsif to_remove > 0 && train.count_cars(car) > to_remove
          train.cargo[car] -= to_remove
          to_remove = 0
        end
      end
      true
    else
      false
    end
  end
end
