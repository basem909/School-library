class Classroom
  attr_accessor :students, :label

  def intialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
