require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'input_class'
require_relative 'message'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @message = Message.new
    @input_data = InputClass.new
  end

  def create_student
    age = @input_data.input_age
    name = @input_data.input_name
    permission = @input_data.input_permission
    class_lable = @input_data.input_class_lable

    @people.push(Student.new(class_lable, age, name, parent_permission: permission))
    @message.success_message('Person')
  end

  def create_teacher
    age = @input_data.input_age
    name = @input_data.input_name
    specialize = @input_data.specialization

    @people.push(Teacher.new(specialize, age, name))
    @message.success_message('Person')
  end

  def create_person
    num_person = @input_data.input_person

    if num_person == 1
      create_student
    elsif num_person == 2
      create_teacher
    else
      @message.error_message('number')
    end
  end

  def create_book
    title = @input_data.input_title
    author = @input_data.input_author

    @books.push(Book.new(title, author))
    @message.success_message('Book')
  end

  def book_list
    @message.info_message('book') if @books.empty?

    @books.each do |book|
      puts "Title: \"#{book.title}\"     Author: \"#{book.author}\""
    end
  end

  def people_list
    @message.info_message('person') if @people.empty?

    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    return @message.error_rental(@books) if @books.empty? || @people.empty?

    book_index = @input_data.book_select(@books)
    person_index = @input_data.person_select(@people)
    date = @input_data.date_rental

    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
    @message.success_message('Rental')
  end

  def rental_list
    return @message.error_rental(@books) if @rentals.empty?

    selected_rental = @input_data.rental_select(@rentals)
    puts 'Rantals'
    selected_rental.each do |rental|
      puts "Data: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
