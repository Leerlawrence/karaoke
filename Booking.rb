# require_relative("../guests.rb")
# require_relative("../rooms.rb")
# require_relative("../song.rb")

numGuests = nil # initialize the variable so you can invoke methods on it

puts  

print "Hi, welcome to Code Clan\'s Karaoke club. How many guests do you have today?"
puts ""
numGuests = gets.chomp
until numGuests.is_a?(Fixnum) do
  numGuests = Integer(gets) rescue nil
end

puts "you have chosen #{numGuests.to_s} guests, let me check availability for you"

# loop do
#   t = Time.now
#     #... content of the loop
#     puts "..."
#  # sleep(t + 1 - Time.now)
# end

puts "OK, this is what I have found"

