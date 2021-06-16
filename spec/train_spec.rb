require './lib/train'
require './lib/car'
require 'rspec'

describe Train do
  it 'exists' do
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train1).to be_a(Train)
  end

  it 'attributes' do
    train1 = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train1.name).to eq('Thomas')
    expect(train1.type).to eq('Tank')
    expect(train1.cargo).to eq({})
  end

  it '.add_cars' do
    train1 = Train.new({name: 'Thomas', type: 'Tank'})
    car1 = Car.new({type: 'Mail', weight: 5})

    train1.add_cars(car1, 2)

    expect(train1.cargo).to eq(car1 => 2)

    train1.add_cars(car1, 3)

    expect(train1.cargo).to eq(car1 => 5)
  end

  xit '.count_cars' do

    expect(train1.count_cars(car1)).to eq(0)
  end
end
