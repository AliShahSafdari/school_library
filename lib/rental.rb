class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @book_rentals = []  # Use an instance variable to store rentals directly for book

    @person = person
    @person_rentals = []  # Use an instance variable to store rentals directly for person

    @book_rentals << self
    @person_rentals << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end
end
