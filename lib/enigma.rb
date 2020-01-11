require_relative 'maker'

class Enigma
  include Maker
  attr_reader :message, :key, :date

  def encrypt(message, key = key_maker, date = date_maker)
    @message = message
    @key = key
    @date = date
  end

end
