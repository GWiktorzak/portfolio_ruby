require_relative '../app/models/employee'

RSpec.describe Employee do
  let(:employee) { Employee.new({ id: 1, username: 'Paul', password: 'secret', role: 'manager' }) }
  let(:employee_rider) { Employee.new({ id: 1, username: 'Paul', password: 'secret', role: 'rider' }) }

  it 'should be initialized with a hash of properties' do
    expect(employee).to be_a(Employee)
  end

  describe '#id' do
    it 'should return the employee id' do
      expect(employee.id).to eq(1)
    end
  end

  describe '#id=' do
    it 'should set the employee id' do
      employee.id = 11
      expect(employee.id).to eq(11)
    end
  end

  describe '#username' do
    it 'should return the username of the Employee' do
      expect(employee.username).to eq('Paul')
    end
  end

  describe '#password' do
    it 'should return the password of the Employee' do
      expect(employee.password).to eq('secret')
    end
  end

  describe '#role' do
    it 'should return the role of the Employee' do
      expect(employee_rider.role).to eq('rider')
    end
  end

  describe '#manager?' do
    it 'should return true if the employee is a manager' do
      expect(employee.manager?).to be true
    end

    it 'should return false if the employee is a rider' do
      expect(employee_rider.manager?).to be false
    end
  end

  describe '#rider?' do
    it 'should return true if the employee is a rider' do
      expect(employee_rider.rider?).to be true
    end

    it 'should return false if the employee is a manager' do
      expect(employee.rider?).to be false
    end
  end
end
