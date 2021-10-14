require_relative './person'

# this is the class teacher
class Teacher < Person
  attr_accessor :role

  def initialize(age:, name:, specialization:, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @role = 'Teacher'
  end

  def can_use_services?
    true
  end
end
