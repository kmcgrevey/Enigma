module Maker

  def key_maker
    (Array.new(5) { rand(0..9) }).join
  end

  def get_todays_date
    Time.now
  end

  def date_maker
    # require "pry"; binding.pry
    get_todays_date.strftime("%d%m%y")
  end

end
