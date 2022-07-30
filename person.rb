require_relative('./nameable')
class Person < Nameable
  @bol = true
  def initialize(age, name = 'unknown', parent_permission = @bol)
    super()
    @age = age
    @name = name
    @id = rand(1...1000)
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def new_rent(person, date)
    @rent = Rentals.new(person, date, self)
    @rentals << @rent
  end
end
