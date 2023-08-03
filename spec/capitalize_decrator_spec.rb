require_relative '../lib/base_decrator'
require_relative '../lib/capitalize_decrator'


describe CapitalizeDecorator do
  context 'we create the CapitalizeDecorator object and test it ' do
    let(:nameable) { double('Nameable', correct_name: 'Alishah') }
    subject(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }
    it 'should delegate correct_name to nameable' do
      expect(capitalize_decorator.correct_name).to eq('Alishah')
    end
  end
end
