require_relative './person'
class Student < Person
  def initialize(_classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    # @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless @students.include?(self)
  end
end

# student = Student.new
# student.play_hookey
# student.age
