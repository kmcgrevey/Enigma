require_relative '../test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new
    Enigma.new.encrypt("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_can_slice_up_a_message_into_groups_of_four

    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]

    assert_equal expected, @shifter.message_slicer("hello world")
    assert_equal expected, @shifter.message_slicer("HELLO World")
  end

  # def test_it_can_slice_up_the_message
  #   expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d"]]
  #
  #   assert_equal
  # end



end
