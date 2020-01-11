class Enigma
  attr_reader :message, :key, :date

  # def initialize
  #
  # end

  def encrypt(message, key, date)
    @message = message
    @key = key
    @date = date
  end

end
