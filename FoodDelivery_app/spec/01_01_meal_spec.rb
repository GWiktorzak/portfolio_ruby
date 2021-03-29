require_relative '../app/models/meal'

RSpec.describe Meal do
  let(:meal) { Meal.new({ id: 1, name: 'Margherita', price: 8 }) }

  it 'should be initialized with a hash of properties' do
    expect(meal).to be_a(Meal)
  end

  describe '#id=' do
    it 'should set the meal id' do
      meal.id = 42
      expect(meal.id).to eq(42)
    end
  end

  describe '#id' do
    it 'should return the meal id' do
      meal.id = 42
      expect(meal.id).to eq(42)
    end
  end

  describe '#name' do
    it 'should return the name of the meal' do
      expect(meal.name).to eq('Margherita')
    end
  end

  describe '#name=' do
    it 'should set the name of the meal' do
      meal.name = 'Pepperoni'
      expect(meal.name).to eq('Pepperoni')
    end
  end

  describe '#price' do
    it 'should return the price of the meal' do
      expect(meal.price).to eq(8)
    end
  end

  describe '#price=' do
    it 'should set the price of the meal' do
      meal.price = 10
      expect(meal.price).to eq(10)
    end
  end
end
