class Corrector
  def initialize(name)
    @name = name
  end
  def corrector_name
    new_name = @name[0...10]
    new_name.capitalize
  end
end
