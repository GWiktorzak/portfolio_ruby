require_relative './app/models/meal'
require_relative './app/repositories/meal_repository'
require_relative './app/controllers/meals_controller'
require_relative 'router'

# meals
csv_file_meals = File.join(__dir__, './data/meals.csv')
meal_repository = MealRepository.new(csv_file_meals)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)
# Start the app
router.run
