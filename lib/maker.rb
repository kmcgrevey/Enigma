module Maker

  def key_maker
    (Array.new(5) { rand(0..9) }).join
  end

  def date_maker
    date = Time.now.strftime("%d%m%Y")
    date[0..3] + date[6..7]
  end

end
