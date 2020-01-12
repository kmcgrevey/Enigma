require_relative '../test/test_helper'
require_relative '../lib/enigma'
require_relative '../lib/indexer'

class IndexerTest < Minitest::Test

  def setup
    @indexer = Enigma.new("02715", "040895")
  end

end
