require_relative '../lib/trimmer_decrator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'Alishah') }
  subject(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  it 'should inherit from Decorator' do
    expect(trimmer_decorator).to be_a(BaseDecorator)
  end

  it 'should delegate correct_name to nameable' do
    expect(trimmer_decorator.correct_name).to eq('Alishah')
  end
end
