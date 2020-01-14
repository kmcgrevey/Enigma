require_relative 'maker'
require_relative 'shifter'
require_relative 'indexer'

class Enigma
  include Maker
  attr_reader :message, :enig_key, :date, :shift_index

  def encrypt(message, enig_key = key_maker, date = date_maker)
    @message = message
    @enig_key = enig_key
    @date = date

    @shift_index = Indexer.new.generate_shift_index(enig_key, date)
    encrypt_msg = Shifter.new.encrypt_shift(message, @shift_index)
    x = { encryption: encrypt_msg, key: enig_key, date: date }
    p x
    x
  end

  def decrypt(message, enig_key, date)
    shift_index = Indexer.new.generate_shift_index(enig_key, date)
    decrypt_msg = Shifter.new.decrypt_shift(message, shift_index)
    y = { decryption: decrypt_msg, key: enig_key, date: date }
    p y
    y
  end






end
