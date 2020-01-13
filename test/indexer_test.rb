require_relative '../test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/indexer'

class IndexerTest < Minitest::Test

  def setup
    # @indexer = Indexer.new("02715", "040895")
    @indexer = Indexer.new
  end

  def test_it_exists
    assert_instance_of Indexer, @indexer
  end

  def test_it_can_read_arguments
skip
    @indexer.generate_shift_index("02715", "040895")

    assert_equal "02715", @indexer.enig_key
    assert_equal "040895", @indexer.date
  end

  def test_it_can_create_a_key_index
  # skip
    expected = { :a => "02",
                :b => "27",
                :c => "71",
                :d => "15"}

    assert_equal expected, @indexer.key_index("02715")
  end

  def test_it_can_create_an_offset_index
# skip
    expected = { :a => "1",
                :b => "0",
                :c => "2",
                :d => "5"}

    assert_equal expected, @indexer.offset_index("040895")
  end

  def test_it_creates_the_shift_key
# skip
    key = {     :a => "02",
                :b => "27",
                :c => "71",
                :d => "15"}

    offset = {  :a => "1",
                :b => "0",
                :c => "2",
                :d => "5"}

    expected = { :a => 3,
                :b => 27,
                :c => 73,
                :d => 20 }

    assert_equal expected, @indexer.shift_index(key, offset)
  end

  def test_it_can_generate_the_shift_index
# skip
    expected = { :a => 3,
                :b => 27,
                :c => 73,
                :d => 20 }

    assert_equal expected, @indexer.generate_shift_index("02715", "040895")
  end

end
