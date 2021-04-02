# Use subject in the group scope to explicitly define the value
# that is returned by the subject method

RSpec.describe Hash do
  subject(:skills) do
    { ruby: 'on Rails', js: 'ES06' }
  end

  it 'has two key-value pairs' do
    expect(subject.length).to eq(2)
    expect(skills.length).to eq(2)
  end

  describe 'nested example' do
    it 'has two key-value pairs' do
      # subject on parent level is availebe on child level
      expect(subject.length).to eq(2)
      expect(skills.length).to eq(2)
    end
  end
end
