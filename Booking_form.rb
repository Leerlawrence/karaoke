# require_relative("../guests.rb")
require_relative("./rooms")
#require_relative("./song.rb")
#require_relative("./test_songs_2")


roomArr = ["1. Rick Astley Room", "2. Black Veil Brides Room", "3. Guns and Roses Room", "4. pavarotti Room"]

numGuests = nil # initialize the variable so you can invoke methods on it


puts ""
puts ""
puts "Hi, welcome to Code Clan\'s Karaoke club."  
puts ""

puts "We have 4 rooms available here :-" 
puts ""

for room in roomArr
puts room #+"/n"
end

puts ""

puts "How many guests will there be?:- "
 #numGuests = gets.chomp
until numGuests.is_a?(Fixnum)  do
  numGuests = Integer(gets) rescue nil
end
puts ""

# check room availibility

case  numGuests.to_i
when 11..30
  puts "You can choose "+"\n\n"+roomArr[0]

when 5..10
  puts "You can choose "+"\n\n"+roomArr[0]+"\n"+ roomArr[1]

when 2..4
  puts "You can choose the following:- "
   puts roomArr[0]+"\n"+roomArr[1]+"\n"+roomArr[2]

when 1
puts "\n"+"OK Billy nae mates \n\n"

puts "You can basically choose all rooms.."
puts roomArr[0]
puts roomArr[1]
puts roomArr[2]
puts roomArr[3]
puts ""

else
  puts "Sorry, no availibility for that number"
end

puts "Please enter the number of the room you require" + "\n"
roomnumber=gets.chomp
puts ""
puts "You have chosen Room " + roomArr[roomnumber.to_i - 1]
puts "-------------"
#puts "What songs would you like to have?"



$i = 0
$num = numGuests

while $i < $num  do
  $i +=1
 #puts "What song would you like for guest" + $i.to_s 
   
end
puts "done"

#songs.getSongs.new()
#songs.get_Songs()


 #return test_songs_2.Get_Songs()

