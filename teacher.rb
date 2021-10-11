require_relative './person'

# this is the class teacher
class Teacher < Person
  def initialize(age:, specialization:, parent_permission: true, name: 'unknown')
    super(age: age, parent_permission: parent_permission, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
