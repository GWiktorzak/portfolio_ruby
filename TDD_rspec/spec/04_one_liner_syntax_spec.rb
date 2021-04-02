# RSpec supports a one-liner syntax for setting an expectation on the
# subject. RSpec will give the examples a doc string that is auto-
# generated from the matcher used in the example.

RSpec.describe 'shorthand syntax' do
  subject { 5 }

  context 'with classic syntax' do
    it 'should equal 5' do
      expect(subject).to eq(5)
    end
  end

  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
  end
end
