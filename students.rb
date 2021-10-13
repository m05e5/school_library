require_relative './person'
# this is the class student
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', classroom, parent_permission: true)
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
