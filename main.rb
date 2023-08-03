require_relative 'lib/app'

def choose_option
  'please choose an option by entering a number
  1 - List all books
  2 - List all people
  3 - create a person
  4 - create a book
  5 - create a rental
  6 - List all rentals for a given person id
  7 - Exit'
end

def choose_num(number, app)
  case number
  when 1 then app.book_list
  when 2 then app.people_list
  when 3 then app.create_person
  when 4 then app.create_book
  when 5 then app.create_rental
  when 6 then app.rental_list
  else puts 'Thank you for using this app'
  end
end

def main
  app = App.new

  loop do
    puts choose_option
    number = gets.chomp.to_i
    break if number == 7

    choose_num(number, app)
    puts "\n"
  end
end

main
