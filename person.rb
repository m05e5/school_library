# frozen_string_literal: true

# this is the class person
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission= true, name= 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    false unless @age >= 18
    true
  end
  private :of_age?

  def can_use_services
    true if of_age? || @parent_permission
  end
end
