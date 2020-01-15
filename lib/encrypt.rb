require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")

message = file.read.chomp

file.rewind

enigma.encrypt(message)

puts ""
puts "Created '#{ARGV[1]}' with the key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"
puts ""

message = File.open(ARGV[1], "w")
message.write(enigma.encrypted[:encryption])
message.close
