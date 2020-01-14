class Shifter

  @alphabet = ("a".."z").to_a << " "

  def create_shift(message, shift_index)
    sliced_msg = message_slicer(message)
    indexed_msg = message_indexer(sliced_msg)

  end

  def message_slicer(message)
    chopped_msg = message.downcase.chars
    chopped_msg.each_slice(4).to_a
  end

  def message_indexer(sliced_msg)
    indexed = {}
    indexed[:a] = sliced_msg.map {|group| group[0]}.compact
    indexed[:b] = sliced_msg.map {|group| group[1]}.compact
    indexed[:c] = sliced_msg.map {|group| group[2]}.compact
    indexed[:d] = sliced_msg.map {|group| group[3]}.compact
    indexed
  end

  def rotate_message(indexed_msg, shift_index)
    rotated = {}
    indexed_msg.reduce({}) do |acc, (key,group)|
      rotated[key] = group.map { |letter| letter + shift_index[key] }
      rotated
    end
  end

end
