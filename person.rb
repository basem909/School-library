require_relative('./nameable')
class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @id = rand(1...1000)
    @parent_permission = parent_permission
    super()
  end

  attr_reader :id
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
end
