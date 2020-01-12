require_relative 'maker'
require_relative 'shifter'

class Enigma
  include Maker
  attr_reader :message, :enig_key, :date, :shift_index

  def encrypt(message, enig_key = key_maker, date = date_maker)
    @message = message
    @enig_key = enig_key
    @date = date
    # @k_i = key_index(enig_key)
    # @o_i = offset_index(date)
    # @shift_index = shift_indexer(@k_i, @o_i)
  end






end
