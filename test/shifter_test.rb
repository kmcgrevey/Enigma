require_relative '../test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new
    # @message = Enigma.new.encrypt("hello world", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

  def test_it_can_create_a_key_index
    # assert_equal Hash.new(0), @shifter.key_index
    # message = mock('enigma')

    # message.stubs(:key).returns("02715")

    expected = { :a => "02", :b => "27", :c => "71", :d => "15"}

    assert_equal expected, @shifter.key_index("02715")
  end

end
