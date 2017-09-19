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


class Scrape < ApplicationRecord
 

	def self.charts
		albums = []
		charts = []
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/chord-charts")  
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page) 
binding.pry

# chart_title:
		albums = parse.css(".chordchartalbum ul").css("li")
		albums.each |album| do
		album = Album.new(album_title = album.text)
		album.save
		end
		# => "Smooth R&B 1-1 A 90 bpm"



# chart_url:
		# parse.css(".chordchartalbum a")[0].attributes["href"].value
# "//d11yja69hmswbm.cloudfront.net/chordcharts/smoothrnb/1/Smooth R%26B 1-1 A 90 bpm.pdf"


	end

	def self.audio
		# scrape audio files
	end
end