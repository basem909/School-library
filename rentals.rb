require('./book')
class Rentals
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    @person.new_rent(self)
    @book.new_rent(self)
  end
end
