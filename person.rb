class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @age = age
    @name = name
    @id = rand(1...1000)
    @parent_permission = parent_permission
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
end

ne = Person.new(13, 'Jack')
ne.age = 24
p ne.age
puts(ne.can_use_services?)
