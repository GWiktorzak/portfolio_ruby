require_relative './share/06_shared_context_spec'

RSpec.describe 'second example in different file' do
  include_context 'common'

  it 'can use shared let variables' do
    expect(some_variable).to eq([1, 2, 3])
  end
end
