RSpec.describe 'Meal' do
  it 'should be initialized with a hash of properties' do
    meal = Meal.new({ id: 1, name: 'Margherita', pricce: 8 })
    expect(meal).to be_a(Meal)
  end
end
