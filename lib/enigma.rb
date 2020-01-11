require_relative 'maker'

class Enigma
  include Maker
  attr_reader :message, :key, :date

  # def initialize
  #
  # end

  def encrypt(message, key = key_maker, date = "none")
    # require "pry"; binding.pry
    @message = message
    @key = key
    @date = date
  end

end
