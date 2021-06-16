require './lib/train'
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
end
