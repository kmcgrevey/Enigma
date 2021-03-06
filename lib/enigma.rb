require_relative 'maker'
require_relative 'shifter'
require_relative 'indexer'

class Enigma
  include Maker
  attr_reader :encrypted, :decrypted

  def encrypt(message, enig_key = key_maker, date = date_maker)
    shift_index = Indexer.new.generate_shift_index(enig_key, date)
    encrypt_msg = Shifter.new.encrypt_shift(message, shift_index)
    @encrypted = {
                  encryption: encrypt_msg,
                  key: enig_key,
                  date: date
                 }
  end

  def decrypt(message, enig_key, date)
    shift_index = Indexer.new.generate_shift_index(enig_key, date)
    decrypt_msg = Shifter.new.decrypt_shift(message, shift_index)
    @decrypted = {
                  decryption: decrypt_msg,
                  key: enig_key,
                  date: date
                 }
  end

end
