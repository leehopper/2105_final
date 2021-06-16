require './lib/car'
require './lib/train'
require './lib/train_yard'
require 'rspec'

describe TrainYard do
  it 'exists' do
    train_yard = TrainYard.new({location: 'Brighton'})

    expect(train_yard).to be_a(TrainYard)
  end

  it 'attributes' do
    train_yard = TrainYard.new({location: 'Brighton'})

    expect(train_yard.trains).to eq([])
  end
end
