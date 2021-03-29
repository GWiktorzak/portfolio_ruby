require_relative '../app/repositories/meal_repository'
require_relative 'support/csv_helper'

RSpec.describe MealRepository do
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

  before(:each) do
    CsvHelper.write_csv(csv_path, meals)
  end

  def elements(repo)
    repo.instance_variable_get(:@meals)
  end

  describe '#initialize' do
    it 'should take one argument: the CSV file path to store meals' do
      expect(MealRepository.instance_method(:initialize).arity).to eq(1)
    end

    it 'should not crash if the CSV path does not exist yet' do
      expect { MealRepository.new('unexisting_file.csv') }.not_to raise_error
    end

    it 'store meals in memory in an instance variable `@meals``' do
      repo = MealRepository.new(csv_path)
      expect(elements(repo)).to be_a(Array)
    end

    it 'loads existing meals from the CSV' do
      repo = MealRepository.new(csv_path)
      loaded_meals = elements(repo) || []
      expect(loaded_meals.length).to eq(5)
    end

    it 'fills the `@meals` with instance of `Meal`, setting the correct types on each property' do
      repo = MealRepository.new(csv_path)
      loaded_meals = elements(repo) || []
      raise if loaded_meals.empty?

      loaded_meals.each do |meal|
        expect(meal).to be_a(Meal)
        expect(meal.id).to be_a(Integer)
        expect(meal.price).to be_a(Integer)
      end
    end
  end
end
