require_relative '../test/test_helper'
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

def setup
  @enigma = Enigma.new
end

def test_it_exists
  assert_instance_of Enigma, @enigma
end

def test_it_has_attributes
  @enigma.encrypt("hello world", "02715", "040895")

  assert_equal "hello world", @enigma.message
  assert_equal "02715", @enigma.key
  assert_equal "040895", @enigma.date
end

def test_it_can_generate_a_missing_key_and_date
  @enigma.encrypt("hello world")

  assert_equal String, @enigma.key.class
  assert_equal 5, @enigma.key.length

  assert_equal 6, @enigma.date.length
  assert @enigma.date[2..3].to_i < 13
end

end
