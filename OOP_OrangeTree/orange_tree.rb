class OrangeTree
  attr_accessor :age, :height, :fruits, :dead, :picked, :total_fruits_grow, :total_fruits_picked

  def initialize
    @age = 0
    @dead = false
    @height = 0
    @fruits = 0
    @total_fruits_grow = 0
    @picked = 0
    @total_fruits_picked = 0
  end

  def one_year_passes!
    @age += 1 if @age < 100
    @height += 1 if !dead? && age <= 10
    grow_fruits
  end

  def dead?
    if @age == 100
      true
    elsif @age > 50
      [false, true].sample
    else
      false
    end
  end

  def grow_fruits
    @total_fruits_grow += @fruits
    pick_a_fruit!
    @fruits = 0

    @fruits = if @age > 5 && @age < 10
                100
              elsif @age >= 10 && @age < 15
                200
              else
                0
              end
  end

  def pick_a_fruit!
    @picked = 0
    @fruits.positive? ? @picked += [12, 24, 48, 96, 100].sample : @picked += 0
    @total_fruits_picked += @picked
  end
end
