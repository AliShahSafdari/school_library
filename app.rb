require_relative 'student'
require_relative 'person'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def choose_option
    puts 'please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - create a person'
    puts '4 - create a book'
    puts '5 - create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    if permission.downcase == 'y'
      student = Student.new('classroom', age, name, parent_permission: true)
      puts 'Person created successfully'
    elsif permission.downcase == 'n'
      student = Student.new('classroom', age, name, parent_permission: false)
      puts 'Person created successfully'
    else
      puts 'you write the wronge word'
    end
    @people.push(student)
    puts ''
    main
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    puts 'Person created successfully'
    @people.push(teacher)
    puts ''
    main
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num_person = gets.chomp.to_i
    if num_person == 1
      create_student
    elsif num_person == 2
      create_teacher
    else
      puts 'you prese wronge number'
    end
  end

  def create_book
    print 'Title : '
    title = gets.chomp
    print 'Author : '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    puts ''
    main
  end

  def book_list
    puts 'Please create a book first.' if @books.empty?
    @books.each do |book|
      puts "Title: \"#{book.title}\"     Author: \"#{book.author}\""
    end
    puts ''
    main
  end

  def people_list
    puts 'Please create a person at first.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
    main
  end

  def create_rental
    return if @books.empty? || @people.empty?

    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\"    Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts ''
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts ''
    print 'Date(DD-MM-YYYY): '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
    puts ''
    main
  end

  def rental_list
    return if @rentals.empty?

    print 'ID of person: '
    person_id = gets.chomp.to_i
    selected_rental = @rentals.select { |rental| rental.person.id == person_id }
    puts 'Rantals'
    main if selected_rental.empty?
    selected_rental.each do |rental|
      puts "Data: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    puts ''
    main
  end

  def choose_num(number)
    case number
    when 1
      book_list
    when 2
      people_list

    when 3
      create_person

    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_list
    else
      puts 'Thank you for using this app'
      nil
    end
  end

  def main
    choose_option
    number = gets.chomp.to_i
    choose_num(number)
  end
end
