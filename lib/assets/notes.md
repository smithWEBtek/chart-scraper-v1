
_____________________________________________________
WORK LIST

[x] 1. Get git / heroku / rails basic app working
[x] 2. Define data model
[x] 3. Create DB migrations, run and test
[x] 4. Confirm DB works on Heroku console
[x] Build basic index views for Genres, Albums, Tracks, Charts
[] 5. Build scraper methods to get charts

[] All charts, with genre (find_or_create) from the chord_charts page

	title, url_suffix


/genres
	/genres/:id  (album#), if #-<instrument> = "music minus 1 track"
		scrape "/genres/<name-of-genre>/" + any following digits only
		to get that number's album page
			<a href="/genres/smooth-jazz/5" album-id="236" album-number="5">
/albums

/chord-charts (for this album, in a zip file)




[] All zips of charts, from the album page
[]	1: Go to Album page URL
[]	2: Download Charts for this Album (zip file)


[] 6. Build methods to create chart attributes in DB
		columns in Chart table:  :genre, :title, :key, :bpm

[] 7. Build methods to download chart PDF files 
[] 8. Build methods to store PDF chart files on Cloudinary, get URLS
[] 9. Views for charts using Cloudinary URLS

[] 10. Sound files

_____________________________________________________
DATA MODEL:
Genre
	Album
		Track | Chart
		Track | Chart
		Track | Chart
	Album
		Track | Chart
		Track | Chart
		Track | Chart
	Album
		Track | Chart
		Track | Chart
		Track | Chart
_____________________________________________________
_____________________________________________________
Genre
	:title
has_many :albums

Album 
	:title
	:genre_id
belongs_to :genre
has_many :album_tracks
has_many :tracks, through: :album_tracks

has_many :album_charts
has_many :charts, through: :album_charts

Track
	:title
has_many :album_tracks
has_many :albums, through: :album_tracks


Chart
	:title
has_many :album_charts
has_many :albums, through: :album_charts
 
AlbumTracks
	belongs_to :album
	belongs_to :chart

AlbumCharts
	belongs_to :album
	belongs_to :track