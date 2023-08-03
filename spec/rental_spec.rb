require_relative '../lib/rental'

describe Rental do
  context 'we create the Rental object and test it' do
    before :each do
      person = double('Person')
      allow(person).to receive(:age) { 24 }
      allow(person).to receive(:name) { 'ali' }
      allow(person).to receive(:parent_permission) { true }

      book = double('book')
      allow(book).to receive(:title) { 'Harry Potter' }
      allow(book).to receive(:author) { 'Brian' }

      @rental = Rental.new('2023-05-24', book, person)
    end

    it 'checking rental instance' do
      expect(@rental).to be_instance_of Rental
    end
  end
end
