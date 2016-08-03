require "rubygems"
require 'json'
require "httparty"


#Mike waz 'ere'
def search(search_terms)
  search_string = search_terms.split(' ').join('+')
  response = HTTParty.get("http://tinysong.com/s/#{search_string}?format=json&key=API_KEY_OMITTED_FOR_REVIEW")
  song_hash = JSON.parse(response.body)
  #puts "#{song_hash}"
end




def view_song_search(song_hash)
  term_width       = %x'tput cols'.to_i # Executes terminal
  total_char_limit = term_width - 9
  field_limit      = total_char_limit / 3

  # Sets width of each column to the width of it's highest data.
  artist_width = album_width = song_width = 0
  song_hash.each do |song|
    if song["ArtistName"].length > artist_width then artist_width = song["ArtistName"].length end
    if song["AlbumName"].length > album_width then album_width = song["AlbumName"].length end
    if song["SongName"].length > song_width then song_width = song["SongName"].length end
  end


  # Sets the minimum column width equal to header width.
  if artist_width < "Artist".length then artist_width = "Artist".length end
  if album_width < "Album".length then album_width = "Album".length end
  if song_width < "Song".length then song_width = "Song".length end

  # If total width is higher than terminal width, reduce total width to fit.
  if artist_width + album_width + song_width > total_char_limit
    artist_width = album_width = song_width = field_limit
  end

  # Where things get cryptic.
  printf("+%s+%s+%s+\n", "-" * (artist_width + 1), "-" * (album_width + 2), "-" * (song_width + 2))
  printf("\e[7m|%-#{artist_width}s | %-#{album_width}s | %-#{song_width}s |\e[0m\n", "Artist", "Album", "Song")
  printf("+%s+%s+%s+\n", "-" * (artist_width + 1), "-" * (album_width + 2), "-" * (song_width + 2))

  song_hash.each do |song|
    # Sets data of each column to not exceed column width.
    if song["ArtistName"].length > artist_width || 
       song["AlbumName"].length > album_width ||
       song["SongName"].length > song_width
      artist_name = (song["ArtistName"])[0...artist_width]
      album_name = (song["AlbumName"])[0...album_width]
      song_name = (song["SongName"])[0...song_width]
    else
      artist_name = song["ArtistName"]
      album_name  = song["AlbumName"]
      song_name   = song["SongName"]
    end


    printf("|%s%s | %s%s | %s%s |\n",artist_name, ' ' * (artist_width - artist_name.length),
                                     album_name, ' ' * (album_width  - album_name.length),
                                     song_name,   ' ' * (song_width   - song_name.length))
    printf("+%s-%s-%s+\n", "-" * (artist_width + 1), "-" * (album_width + 2), "-" * (song_width + 2))
  end
end

puts "Enter your search terms: "
view_song_search(search(gets.chomp))