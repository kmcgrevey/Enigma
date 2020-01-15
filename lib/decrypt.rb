require_relative 'enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")

message = file.read.chomp
file.rewind

enigma.decrypt(message, ARGV[2], ARGV[3])

puts ""
puts "Created '#{ARGV[1]}' with the key #{enigma.decrypted[:key]} and date #{enigma.decrypted[:date]}"
puts ""

message = File.open(ARGV[1], "w")
message.write(enigma.decrypted[:decryption])
message.close
