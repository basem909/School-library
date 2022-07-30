require_relative('./book')
require_relative('./student')
require_relative('./teacher')
require_relative('./rentals')

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def books_list
    books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def people_list
    people.each { |person| puts "Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
  end

  # rubocop:disable Metrics/MethodLength
  def add_person
    puts 'Do you want to add a student (1) or a teacher (2) '
    person = gets.chomp.to_i
    puts 'Enter name'
    name = gets.chomp
    puts 'Enter age'
    age = gets.chomp.to_i

    case person
    when 1
      puts 'Enter classroom'
      classroom = gets.chomp
      puts 'Has parent permission [Y/N]'
      permission = gets.chomp
      @people << if permission == 'Y'
                   Student.new(classroom, age, name, parent_permission: true)
                 else
                   Student.new(classroom, age, name, parent_permission: false)
                 end

    when 2
      puts 'Enter specialization:'
      specialization = gets.capitalize.chomp
      @people << Teacher.new(specialization: specialization, age: age, name: name)
    else
      puts 'Invalid choice, please try again'
    end
    puts 'Person created successfully'
  end
  # rubocop:enable Metrics/MethodLength

  def add_book
    print 'Enter title:'
    title = gets.chomp
    print 'Enter author:'
    author = gets.chomp
    books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def rent_book
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "No.#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number'
    people.each_with_index do |person, index|
      puts "No.#{index}) [#{person.class}] Name: #{person.name} age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date YYYY/MM/DD:'
    rent_date = gets.chomp
    register_rent = Rental.new(rent_date, people[person_index], books[book_index])
    rentals.push(register_rent)
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'Enter ID of person:'
    person_id = gets.chomp.to_i
    puts 'Enter rentals:'
    rented_by_person = rentals.select do |rented|
      rented.person.id == person_id
    end
    rented_by_person.each { |rent| puts "Date: #{rent.date}, Book \"#{rent.book.title}\" by: #{rent.book.author}" }
  end
end
