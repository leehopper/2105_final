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
end
