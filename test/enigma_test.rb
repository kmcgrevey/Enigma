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

end
