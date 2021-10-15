require_relative './person'
# this is the class student
class Student < Person
  attr_reader :classroom
  attr_accessor :role

  def initialize(age, name = 'unknown', classroom:, parent_permission:)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @role = 'Student'
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
