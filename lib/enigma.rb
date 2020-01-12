require_relative 'maker'
require_relative 'shifter'

class Enigma
  include Maker
  attr_reader :message, :enig_key, :date, :shift_index

  def encrypt(message, enig_key = key_maker, date = date_maker)
    @message = message
    @enig_key = enig_key
    @date = date
    @k_i = key_index(enig_key)
    @o_i = offset_index(date)
    # @shift_index = shift_indexer(@k_i, @o_i)
  end

  def key_index(enig_key)
    { :a => enig_key[0..1],
      :b => enig_key[1..2],
      :c => enig_key[2..3],
      :d => enig_key[3..4]}
  end

  def offset_index(date)
    date_squared = (date.to_i * date.to_i).to_s
    { :a => date_squared[-4],
      :b => date_squared[-3],
      :c => date_squared[-2],
      :d => date_squared[-1],}
  end

  # def shift_indexer(enig_key, offset)
  #   x = a.merge(b) { |k, o, n| o + n }
  #   require "pry"; binding.pry
  # end

end
