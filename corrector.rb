class Corrector
  def initialize(names)
    @name = name
  end

  def corrector_name
    new_name = @name[0...10]
    new_name.capitalize
  end
end
