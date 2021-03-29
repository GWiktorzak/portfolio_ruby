require_relative '../app/models/customer'

RSpec.describe Customer do
  let(:customer) { Customer.new({ id: 1, name: 'Greg Ruby', address: 'Gdynia' }) }
  it 'should be initialized with a hash of properties' do
    expect(customer).to be_a(Customer)
  end

  describe '#id' do
    it 'should return the customer id' do
      expect(customer.id).to eq(1)
    end
  end

  describe '#id=' do
    it 'should set the customer id' do
      customer.id = 11
      expect(customer.id).to eq(11)
    end
  end

  describe '#name' do
    it 'should return the name of the Customer' do
      expect(customer.name).to eq('Greg Ruby')
    end
  end

  describe '#address' do
    it 'should return the address of the Customer' do
      expect(customer.address).to eq('Gdynia')
    end
  end
end
