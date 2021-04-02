RSpec.describe 'not_to method' do
  it 'checks two values not matches each other'
    expect(7).not_to eq(8)
    expect('Ruby').not_to eq('JavaScript')
    expect([7, 8]).not_to eq([9, 10])
  end
end 