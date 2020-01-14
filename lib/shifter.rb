# require_relative 'enigma'

class Shifter
  # attr_reader :message
  @alphabet = ("a".."z").to_a << " "

  def create_shift(message, shift_index)
    sliced_msg = message_slicer(message)
    indexed_message = message_indexer(sliced_msg)
    # @message = message
    # @shift_index = shift_index
  end

  def message_slicer(message)
    chopped_msg = message.downcase.chars
    @sliced_msg = chopped_msg.each_slice(4).to_a
  end

  def message_indexer(sliced_msg)
    indexed = {}
    indexed[:a] = sliced_msg.map {|group| group[0]}.compact
    indexed[:b] = sliced_msg.map {|group| group[1]}.compact
    indexed[:c] = sliced_msg.map {|group| group[2]}.compact
    indexed[:d] = sliced_msg.map {|group| group[3]}.compact
    indexed
  end

end
