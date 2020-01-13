module Maker

  def key_maker
    (Array.new(5) { rand(0..9) }).join
  end

  def date_maker
    Time.now.strftime("%d%m%y")
  end

end
