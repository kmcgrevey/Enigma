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

    # shift_index = {:a=>"W", :b=>"X", :c=>"Y", :d=>"Z"}
    shift_index = {:a=>3, :b=>27, :c=>73, :d=>20}

    # expected = {:a=>["hW", "oW", "rW"],
    #             :b=>["eX", " X", "lX"],
    #             :c=>["lY", "wY", "dY"],
    #             :d=>["lZ", "oZ"]}
    expected = {:a=>["k", "r", "u"],
      :b=>["e", " ", "l"],
      :c=>["d", "o", "w"],
      :d=>["e", "h"]}

    assert_equal expected, @shifter.rotate_message(indexed_msg, shift_index)
  end



end
