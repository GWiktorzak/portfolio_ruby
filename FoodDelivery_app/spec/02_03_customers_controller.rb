require_relative 'support/csv_helper'
require_relative '../app/controllers/customers_controller'
require_relative '../app/repositories/customer_repository'

RSpec.describe CustomersController do
  let(:customers) do
    [
      %w[id name address],
      [1, 'Paul McCartney', 'Liverpool'],
      [2, 'John Bonham', 'Redditch'],
      [3, 'John Entwistle', 'Chiswick']
    ]
  end
  let(:csv_path) { 'spec/support/customers.csv' }
  let(:repository) { CustomerRepository.new(csv_path) }

  before(:each) do
    CsvHelper.write_csv(csv_path, customers)
  end

  it 'should be initialized with a `CustomerRepository` instance' do
    controller = CustomersController.new(repository)
    expect(controller).to be_a(CustomersController)
  end

  describe '#add' do
    it 'should ask the user for a name and address, then store the new customer' do
      controller = CustomersController.new(repository)
      allow_any_instance_of(Object).to receive(:gets).and_return('Ruby')

      controller.add

      expect(repository.all.length).to eq(4)
      expect(repository.all[3].name).to eq('Ruby')
      expect(repository.all[3].address).to eq('Ruby')
    end
  end

  describe '#list' do
    it 'should grab customers from the repo and display them' do
      controller = CustomersController.new(repository)
      customers.drop(1).each do |customer_array|
        expect($stdout).to receive(:puts).with(/#{customer_array[1]}/)
      end

      controller.list
    end
  end
end
