require('./rentals')
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def new_rent(person, date)
    @rent = Rentals.new(person, date, self)
    @rentals << @rent
  end
end
