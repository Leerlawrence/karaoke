#attr_reader :songChoice

class Library

  attr_reader :songs

  def initialize()
    @songs = get_Songs()
  end

  def get_Songs()
    albums = {}
    songs = [
      { :title => 'Caught In The Middle', :artist => 'A1', :Length => '3:28' },
      { :title => 'Like A Rose', :artist => 'A1', :Length => '4:11' },
      { :title => 'More Than A Woman', :artist => 'Aaliyah', :Length => '3:18' },
      { :title => 'Abba Medley', :artist => 'Abba', :Length => '6:31' },
      { :title => 'Bang-A-Boomerang', :artist => 'Abba', :Length => '3:00' },
      { :title => 'Dancing Queen', :artist => 'Abba', :Length => '3:31' },
      { :title => 'Chiquitita', :artist => 'Abba', :Length => '4:41' },
      { :title => 'Fernando', :artist => 'Abba', :Length => '4:17' },
    ]
    ndxNo=0
    songs.each do |song|  # each song is a record
      song[:index] = ndxNo+1              # This adds an index nmber to each entry in songs
      album = albums[song[:album]] ||= {} # There is no entry for :album in a song hasj
      album[:title] = song[:title]
      (album[:songs] ||= []).push(song)
      puts song[:index].to_s + "\t"+ song[:title]
    end

    #albums = songs.group_by { |song| song[:album] }
    albums = songs.sort_by { |song| song[:title] }  #' this was to show titles before the nbelow
    system("clear")
    albums.each_index do | index |
      puts index.to_s + "\t" + albums[index][:title]
    end
    return songs
  end

  #array.each_with_index {|val, index| puts "#{val} => #{index}" }

end #class end


lib = Library.new
puts "Please enter the song number"
song_number=gets.chomp.to_i

song = lib.songs.find { |s| s[:index] == song_number}
puts song[:title]
#return albums
# Angel Eyes  ABBA  4:07  
# Sing nowAdd to…
# Bang-A-Boomerang  ABBA  3:00  
# Sing nowAdd to…
# Chiquitita  ABBA  4:41  
# Sing nowAdd to…
# Dancing Queen ABBA  3:31  
# Sing nowAdd to…
# Does Your Mother Know ABBA  3:07  
# Sing nowAdd to…
# Fernando  ABBA  4:17  
# Sing nowAdd to…
# Gimme Gimme Gimme ABBA  4:36  
# Sing nowAdd to…
# Happy New Year  ABBA  4:22

