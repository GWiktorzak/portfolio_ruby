class View
  def ask_name_and_price
    puts 'Enter meal name'
    name = gets.chomp
    puts 'Enter price of the meal'
    price = gets.chomp.to_i
    { name: name, price: price }
  end

  def list_all(element)
    element.each do |item|
      puts "🍕 - #{item.name} 💰 - #{item.price}"
    end
  end
end
