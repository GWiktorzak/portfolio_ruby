require_relative '../app/controllers/meals_controller'
require_relative '../app/repositories/meal_repository'
require_relative 'support/csv_helper'

RSpec.describe MealsController do
  let(:meals) do
    [
      %w[id name price],
      [1, 'Margherita', 8],
      [2, 'Capricciosa', 11],
      [3, 'Napolitana', 9],
      [4, 'Funghi', 12],
      [5, 'Calzone', 10]
    ]
  end
  let(:csv_path) { 'spec/support/meals.csv' }
  let(:repository) { MealRepository.new(csv_path) }
  let(:controller) { MealsController.new(repository) }

  before(:each) do
    CsvHelper.write_csv(csv_path, meals)
  end

  it 'should be initialized with a `MealRepository` instance' do
    expect(controller).to be_a(MealsController)
  end

  describe '#add' do
    it 'should ask the user for a name and price, then store the new meal' do
      allow_any_instance_of(Object).to receive(:gets).and_return('12')
      controller.add

      expect(repository.all.length).to eq(6)
      expect(repository.all[5].name).to eq('12')
      expect(repository.all[5].price).to eq(12)
    end
  end

  describe '#list' do
    it 'should grab meals from the repo and display them' do
      meals.drop(1).each do |meal_array|
        expect($stdout).to receive(:puts).with(/#{meal_array[1]}/)
      end

      controller.list
    end
  end
end
