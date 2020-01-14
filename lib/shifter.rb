# require_relative 'enigma'

class Shifter
  # attr_reader :message

  def create_shift(message, shift_index)
    message_indiv = message_chopper(message)
    # @message = message
    # @shift_index = shift_index
  end

  def message_chopper(message)
    message.downcase.chars
  end


end
