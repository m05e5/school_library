require_relative './corrector'
# this is the class person
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @instance_of_corrector = Corrector.new(@name)
  end

  def of_age?
    false unless @age >= 18
    true
  end

  def validate_name
    @name = @instance_of_corrector.corrector_name
  end
  private :of_age?

  def can_use_services
    true if of_age? || @parent_permission
  end
end
