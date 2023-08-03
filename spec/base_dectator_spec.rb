require_relative '../lib/base_decrator'

describe BaseDecorator do
  context 'we create the baseDecorator object and test it ' do
    let(:base_decrator) { BaseDecorator.new('nameable') }
    it ' BaseDecorator must be nameable' do
      expect(base_decrator.nameable).to eq('nameable')
    end

    it 'checking base_decroator instance' do
      expect(base_decrator).to be_instance_of BaseDecorator
    end
  end
end
