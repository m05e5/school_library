class Corrector
  def corrector_name(name)
    new_name = name[0...10]
    new_name.capitalize
  end
end