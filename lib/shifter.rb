# require_relative 'enigma'

class Shifter
  # attr_reader :message
  @alphabet = ("a".."z").to_a << " "

  def create_shift(message, shift_index)
    new_message = message_slicer(message)
    # sliced_message = message_slicer(new_message)
    # @message = message
    # @shift_index = shift_index
  end

  def message_slicer(message)
    chopped_msg = message.downcase.chars
    chopped_msg.each_slice(4).to_a
  end

  # def message_slicer(chopped_msg)
  #
  # end

end
