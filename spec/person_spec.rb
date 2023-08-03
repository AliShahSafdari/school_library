require_relative '../lib/person'

describe Person do
  context 'we create the person object and test it ' do
    let(:person) { Person.new(24, 'Nasir') }
    let(:book) { Book.new('C++', 'Nasir') }
    let(:date) { '30/10/2023' }
    let(:rental) { Rental.new(date, book, person) }
    it 'Person name must be Nasir' do
      expect(person.name).to eq('Nasir')
    end
    it 'Perosn age must be 24' do
      expect(person.age).to be 24
    end
    it 'Perosn parent_permission must be true' do
      expect(person.parent_permission).to be true
    end

    it 'Teacher can_use_services must be true' do
      expect(person.can_use_services?).to eq(true)
    end
    it 'Add rentals must work prperly' do
      expect(person.add_rental(date, book)).to be_a(Rental)
    end
  end
end
