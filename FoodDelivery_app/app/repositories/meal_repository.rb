require 'csv'
require_relative '../models/meal'

class MealRepository
  attr_accessor :csv_path

  def initialize(csv_path)
    @meals = []
    @next_id = 1
    @csv_path = csv_path
    load_csv if File.exist?(csv_path)
  end

  # add a new meal
  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  # get all meals
  def all
    @meals
  end

  # find meal by id
  def find(number)
    @meals.find { |meal| meal.id == number }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      meal = Meal.new(row)
      @meals << meal
    end
    @next_id = @meals.last.id + 1 if @meals.last
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
