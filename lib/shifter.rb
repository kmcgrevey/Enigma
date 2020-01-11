class Shifter

  def key_index(key)
    # require "pry"; binding.pry
    { :a => key[0..1], :b => key[1..2], :c => key[2..3], :d => key[3..4]}
  end

end
