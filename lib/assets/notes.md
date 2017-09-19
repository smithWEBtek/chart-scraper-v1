
_____________________________________________________
WORK LIST


[x] 1. Get git / heroku / rails basic app working
[ ] 2. Define data model
[ ] 3. Create DB migrations, run and test
[ ] 4. Confirm DB works on Heroku console
[ ] 5. Build scraper methods to get charts
[ ] 6. Build methods to create chart attributes in DB
[ ] 7. Build methods to download chart PDF files 
[ ] 8. Build methods to store PDF chart files on Cloudinary, get URLS
[ ] 9. Views for charts using Cloudinary URLS


[ ] 10. Sound files

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
 
AlbumTracks
	belongs_to :album
	belongs_to :chart

AlbumCharts
	belongs_to :album
	belongs_to :track

Track
	:title
has_many :album_tracks
has_many :albums, through: :album_tracks


Chart
	:title
has_many :album_charts
has_many :albums, through: :album_charts
