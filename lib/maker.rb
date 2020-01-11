module Maker

  def key_maker
    (Array.new(5) { rand(0..9) }).join
  end

end
