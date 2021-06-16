class TrainYard
  attr_reader :trains

  def initialize(attribute)
    @location = attribute[:location]
    @trains = []
  end
end
