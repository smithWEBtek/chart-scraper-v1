
_____________________________________________________
WORK LIST
[x] 1. Get git / heroku / rails basic app working
[ ] 2. Define data model
[ ] 3. Create DB migrations, run and test
[ ] 4. Confirm DB works on Heroku console
[ ] 5. Build scraper methods to get charts
[ ] 6. Build methods to create chart attributes in DB
[ ] 7. Build methods to download charts 
[ ] 8. Build methods to store charts on Cloudinary
[ ] 9. Views for charts
[ ] 10. Sound files

_____________________________________________________
DATA MODEL:

Genre
	:name
has_many :albums

Album 
	:title
	:genre_id
belongs_to :genre
has_many :songs
has_many :charts, through: :songs
has_many :audiofiles, through: :songs

Song
	:title
	:album_id
	:chart_id
	:audiofile_id
belongs_to :album
belongs_to :chart
belongs_to :audiofile
 
