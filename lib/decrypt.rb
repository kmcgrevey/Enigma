require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read.chomp
file.rewind

# coded_msg = File.open(ARGV[1], "w")
require "pry"; binding.pry

enigma.decrypt(message, ARGV[2], ARGV[3])
