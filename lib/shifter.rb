class Shifter

  def create_shift(message, shift_index)
    sliced_msg = message_slicer(message)
    indexed_msg = message_indexer(sliced_msg)
    rotated_msg = rotate_message(indexed_msg, shift_index)

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
      rotated[key] = group.map do |letter|
        rotate_letter(letter, shift_index[key])
      end
      rotated
    end
  end

  def rotate_letter(letter, shift)
    alphabet = ("a".."z").to_a << " "
    return letter if alphabet.include?(letter) == false
    cypherbet = alphabet.rotate(shift)
    cypherbet[alphabet.index(letter)]
  end

end
