require_relative '../models/developer'
# describe_class is dynamic
# if during development class name is changed
# in rspec file we need to change only class name on line 9

RSpec.describe Developer do
  subject { described_class.new('Greg') }
  let(:filip) { described_class.new('Filip') }

  it 'represents a great developer' do
    expect(subject.name).to eq('Greg')
    expect(filip.name).to eq('Filip')
  end
end
