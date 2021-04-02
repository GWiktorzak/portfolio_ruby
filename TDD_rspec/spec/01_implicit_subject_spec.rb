# If the first argument to an example group is a class, an instance of that
# class is exposed to each example in that example group via the subject
# method.

RSpec.describe Hash do
  it 'should start off empty' do
    expect(subject.length).to eq(0)
    subject[:key] = 'value'
    expect(subject.length).to eq(1)
  end

  it 'is isolated between examples' do
    expect(subject.length).to eq(0)
  end
end
