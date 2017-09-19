######################################################

DATA_genres = {
  :genre_keys =>
    ["title"],
  :genres => [
    ["unspecified"],
    ["Smooth Jazz"],
    ["Smooth RnB"],
    ["Smooth Latin"],
    ["deleted"]
  ]
}

def make_genres
  DATA_genres[:genres].each do |genre|
    new_genre = Genre.new
    genre.each_with_index do |attribute, i|
      new_genre.send(DATA_genres[:genre_keys][i]+"=", attribute)
    end
    new_genre.save
  end
end

######################################################

DATA_albums = {
  :album_keys =>
    ["title", "genre_id"],
  :albums => [
    ["Album 1", 1],
    ["Album 2", 2],
    ["Album 3", 3]
  ]
}

def make_albums
  DATA_albums[:albums].each do |album|
    new_album = Album.new
    album.each_with_index do |attribute, i|
      new_album.send(DATA_albums[:album_keys][i]+"=", attribute)
    end
    new_album.save
  end
end

######################################################

DATA_tracks = {
  :track_keys =>
    ["title"],
  :tracks => [
    ["track 1"],
    ["track 2"],
    ["track 3"]
  ]
}

def make_tracks
  DATA_tracks[:tracks].each do |track|
    new_track = Track.new
    track.each_with_index do |attribute, i|
      new_track.send(DATA_tracks[:track_keys][i]+"=", attribute)
    end
    new_track.save
  end
end

######################################################

DATA_album_tracks = {
  :album_track_keys =>
    ["album_id", "track_id"],
  :album_tracks => [
    [1,1],
    [1,2],
    [1,3]
  ]
}

def make_album_tracks
  DATA_album_tracks[:album_tracks].each do |album_track|
    new_album_track = AlbumTrack.new
    album_track.each_with_index do |attribute, i|
      new_album_track.send(DATA_album_tracks[:album_track_keys][i]+"=", attribute)
    end
    new_album_track.save
  end
end

######################################################

DATA_charts = {
  :chart_keys =>
    ["title"],
  :charts => [
    ["chart 1"],
    ["chart 2"],
    ["chart 3"]
  ]
}

def make_charts
  DATA_charts[:charts].each do |chart|
    new_chart = Chart.new
    chart.each_with_index do |attribute, i|
      new_chart.send(DATA_charts[:chart_keys][i]+"=", attribute)
    end
    new_chart.save
  end
end

######################################################

DATA_album_charts = {
  :album_chart_keys =>
    ["album_id", "chart_id"],
  :album_charts => [
    [1,1],
    [1,2],
    [1,3]
  ]
}

def make_album_charts
  DATA_album_charts[:album_charts].each do |album_chart|
    new_album_chart = AlbumChart.new
    album_chart.each_with_index do |attribute, i|
      new_album_chart.send(DATA_album_charts[:album_chart_keys][i]+"=", attribute)
    end
    new_album_chart.save
  end
end

######################################################

def main
  make_genres
	make_albums
	make_tracks 
	make_charts
	make_album_tracks
	make_album_charts
end

main
