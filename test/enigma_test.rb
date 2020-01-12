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

  def test_it_can_generate_a_missing_date
    @enigma.encrypt("hello world", "02715")

    assert_equal 6, @enigma.date.length
    assert @enigma.date[2..3].to_i < 13

    @enigma.stubs(:date).returns("071241")

    assert_equal "071241", @enigma.date

    @enigma.encrypt("hello world")

    assert_equal String, @enigma.key.class
    assert_equal 5, @enigma.key.length
  end

  def test_it_can_create_a_key_index
    expected = { :a => "02",
                :b => "27",
                :c => "71",
                :d => "15"}

    assert_equal expected, @enigma.key_index("02715")
  end

  def test_it_can_create_an_offset_index
    expected = { :a => "1",
                :b => "0",
                :c => "2",
                :d => "5"}

    assert_equal expected, @enigma.offset_index("040895")
  end

end
