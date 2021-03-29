require 'csv'
require_relative '../models/customer'
class CustomerRepository
  attr_accessor :csv_path

  def initialize(csv_path)
    @customers = []
    @next_id = 1
    @csv_path = csv_path
    load_csv if File.exist?(csv_path)
  end

  # create user
  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  # display all users
  def all
    @customers
  end

  # find user
  def find(number)
    @customers.find { |customer| customer.id == number }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      customer = Customer.new(row)
      @customers << customer
    end
    @next_id = @customers.last.id + 1 if @customers.last
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
