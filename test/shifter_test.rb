require_relative '../test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/shifter'

class ShifterTest < Minitest::Test

  def setup
    @shifter = Shifter.new
  end

  def test_it_exists
    assert_instance_of Shifter, @shifter
  end

end
