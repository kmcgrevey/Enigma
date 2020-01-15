require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")

message = file.read.chomp
file.rewind

coded_msg = File.open(ARGV[1], "w")

# enigma.encrypt(message, "02715", "040895")
enigma.encrypt(message)



# require "pry"; binding.pry
