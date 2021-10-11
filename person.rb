class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, _parent_permission = true, name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def is_of_age?
    false unless @age >= 18
    true
  end
  private :is_of_age

  def can_use_services 
    
end
