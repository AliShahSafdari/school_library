require_relative '../lib/book'

describe Book do
  context 'we create the book object and test it ' do
    let(:book) { Book.new('C++', 'Safdari') }
    it 'Book title must be C++' do
      expect(book.title).to eq('C++')
    end
    it 'Book author must be C++' do
      expect(book.author).to eq('Safdari')
    end
  end
end
