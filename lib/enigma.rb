require_relative 'maker'
require_relative 'shifter'

class Enigma
  include Maker
  attr_reader :message, :key, :date

  def encrypt(message, key = key_maker, date = date_maker)
    @message = message
    @key = key
    @date = date
    key_index(@key)
    offset_index(@date)
  end

  def key_index(key)
    { :a => key[0..1],
      :b => key[1..2],
      :c => key[2..3],
      :d => key[3..4]}
  end

  def offset_index(date)
    date_squared = (date.to_i * date.to_i).to_s
    { :a => date_squared[-4],
      :b => date_squared[-3],
      :c => date_squared[-2],
      :d => date_squared[-1],}
  end

end
