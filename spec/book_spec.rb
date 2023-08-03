require_relative '../lib/book'

describe Book do
  context 'we create the book object and test it ' do
    let(:book) { Book.new('C++', 'Safdari') }
    let(:person) { Person.new('Safdari', 23) }
    let(:date) { '30/10/2023' }
    let(:rental) { Rental.new(date, book, person) }
    it 'Book title must be C++' do
      expect(book.title).to eq('C++')
    end
    it 'Book author must be C++' do
      expect(book.author).to eq('Safdari')
    end

    it 'Add rentals must work prperly' do
      expect(book.add_rental(date, person)).to be_a(Rental)
    end
  end
end
