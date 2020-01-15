require_relative '../test/test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_returns_encrypted_message_with_key_and_date
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_encrypt_with_special_characters
    expected = {
                encryption: "y,bcxfnwpwgdjwp!!",
                key: "43210",
                date: "071241"
               }
    assert_equal expected, @enigma.encrypt("I, shall return!!", "43210", "071241")
  end

  def test_it_can_generate_a_missing_date
    @enigma.encrypt("hello world", "02715")

    assert_equal 6, @enigma.encrypted[:date].length
    assert @enigma.encrypted[:date][2..3].to_i < 13

    day = @enigma.encrypted[:date][0..1].to_i
    assert day > 0 && day < 32
  end

  def test_it_can_generate_a_missing_key
    @enigma.encrypt("I, shall return!!")

    assert_equal Integer, @enigma.encrypted[:key].to_i.class
    assert_equal 5, @enigma.encrypted[:key].length
  end

  def test_it_returns_decrypted_message_with_key_and_date
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_with_special_characters
    expected = {
                decryption: "i, shall return!!",
                key: "43210",
                date: "071241"
               }
    assert_equal expected, @enigma.decrypt("y,bcxfnwpwgdjwp!!", "43210", "071241")
  end

end
