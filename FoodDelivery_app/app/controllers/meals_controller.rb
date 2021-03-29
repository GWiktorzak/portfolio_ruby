require_relative '../repositories/meal_repository'
require_relative '../views/view'
require_relative '../models/meal'

class MealsController
  attr_accessor :meal_repository
  attr_reader :view

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  def add
    # ask the user for a name and price & store
    new_meal = @view.ask_name_and_price
    meal = Meal.new(new_meal)
    @meal_repository.create(meal)
  end

  def list
    meals = @meal_repository.all
    @view.list_all(meals)
  end
end