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

    expected = [["h", "e", "l", "l"],
                ["o", " ", "w", "o"],
                ["r", "l", "d"]]

    assert_equal expected, @shifter.message_slicer("hello world")
    assert_equal expected, @shifter.message_slicer("HELLO World")
  end

  def test_it_can_index_the_message
    sliced_msg = [["h", "e", "l", "l"],
                  ["o", " ", "w", "o"],
                  ["r", "l", "d"]]

    expected = {:a=>["h", "o", "r"],
                :b=>["e", " ", "l"],
                :c=>["l", "w", "d"],
                :d=>["l", "o"]}

    assert_equal expected, @shifter.message_indexer(sliced_msg)
  end

  def test_it_can_rotate_the_indexed_message
# skip
    indexed_msg = {:a=>["h", "o", "r"],
                  :b=>["e", " ", "l"],
                  :c=>["l", "w", "d"],
                  :d=>["l", "o"]}

    shift_index = {:a=>3, :b=>27, :c=>73, :d=>20}

    expected = {:a=>["k", "r", "u"],
                :b=>["e", " ", "l"],
                :c=>["d", "o", "w"],
                :d=>["e", "h"]}

    assert_equal expected, @shifter.rotate_message(indexed_msg, shift_index)
  end

  def test_it_can_rotate_a_letter
    assert_equal "e", @shifter.rotate_letter("a", 4)
    assert_equal " ", @shifter.rotate_letter("z", 1)
    assert_equal "a", @shifter.rotate_letter("c", -2)
  end

  def test_it_can_retain_special_characters
    assert_equal "!", @shifter.rotate_letter("!", 4)
    assert_equal ",", @shifter.rotate_letter(",", 23)
    assert_equal ".", @shifter.rotate_letter(".", -72)
  end


end
