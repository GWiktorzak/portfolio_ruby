require_relative 'support/csv_helper'
require_relative '../app/repositories/employee_repository'

RSpec.describe EmployeeRepository do
  let(:employees) do
    [
      %w[id username password role],
      [1, 'paul', 'secret', 'manager'],
      [2, 'john', 'secret', 'rider'],
      [3, 'ringo', 'secret', 'rider']
    ]
  end
  let(:csv_path) { 'spec/support/employees.csv' }
  let(:repo) { EmployeeRepository.new(csv_path) }

  before(:each) do
    CsvHelper.write_csv(csv_path, employees)
  end

  def elements(repo)
    repo.instance_variable_get(:@employees)
  end

  describe '#initialize' do
    it 'should take one argument: the CSV file path to store employees' do
      expect(EmployeeRepository.instance_method(:initialize).arity).to eq(1)
    end

    it 'should not crash if the CSV path does not exist yet' do
      expect { EmployeeRepository.new('unexisting_file.csv') }.not_to raise_error
    end

    it 'should store employees in memory in an instance variable `@employees`' do
      expect(elements(repo)).to be_a(Array)
    end

    it 'should load existing employees from the CSV' do
      loaded_employees = elements(repo) || []
      expect(loaded_employees.length).to eq(3)
    end

    it 'fills the `@employees` with instance of `Employee`, setting the correct types on each property' do
      loaded_employees = elements(repo) || []
      raise if loaded_employees.empty?

      loaded_employees.each do |employee|
        expect(employee).to be_a(Employee)
        expect(employee.id).to be_a(Integer)
        expect(employee.username).not_to be_empty
        expect(employee.password).not_to be_empty
        expect(employee.role).not_to be_empty
      end
    end
  end

  it "EmployeeRepository should not implement a create method (we'll create employees manually in the CSV)" do
    expect(repo).not_to respond_to(:create)
  end

  describe '#all_riders' do
    it 'should return all the riders stored by the repo' do
      expect(repo.all_riders).to be_a(Array)
      expect(repo.all_riders.size).to eq(2)
      expect(repo.all_riders[0].username).to eq('john')
    end

    it 'EmployeeRepository should not expose the @employees through a reader/method' do
      expect(repo).not_to respond_to(:employees)
    end
  end

  describe '#find' do
    it 'should retrieve a specific employee based on its id' do
      employee = repo.find(1)
      expect(employee.id).to eq(1)
      expect(employee.username).to eq('paul')
    end
  end

  describe '#find_by_username' do
    it 'should retrieve a specific employee based on its username' do
      employee = repo.find_by_username('john')
      expect(employee).not_to be_nil
      expect(employee.id).to eq(2)
      expect(employee.username).to eq('john')
    end
  end
end
