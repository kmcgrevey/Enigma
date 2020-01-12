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

  

end
