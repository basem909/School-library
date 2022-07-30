require './app'

class Main
  attr_reader :app

  def initialize
    puts 'School library application'
    @app = App.new
    item_list
  end

  def item_list
    puts '================================'
    puts 'Choose an option:'
    puts '================================'
    puts "
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"
    selection_user
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def selection_user
    selection = gets.chomp.to_i
    case selection
    when 1
      app.books_list
      item_list
    when 2
      app.people_list
      item_list
    when 3
      app.add_person
      item_list
    when 4
      app.add_book
      item_list
    when 5
      app.rent_book
      item_list
    when 6
      app.list_rentals
      item_list
    when 7
      abort('Thank you for using this app!')
    else
      puts 'Invalid selection'
      item_list
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end

Main.new
