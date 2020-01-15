require_relative 'enigma'
require_relative 'maker'
include Maker

enigma = Enigma.new

file = File.open(ARGV[0], "r")

message = file.read.chomp
file.rewind

ARGV[2] = key_maker if ARGV[2] == nil
ARGV[3] = date_maker if ARGV[3] == nil

enigma.encrypt(message, ARGV[2], ARGV[3])

puts ""
puts "Created '#{ARGV[1]}' with the key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"
puts ""

message = File.open(ARGV[1], "w")
message.write(enigma.encrypted[:encryption])
message.close
