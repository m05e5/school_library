require_relative './person'

# this is the class student
class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission = true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
