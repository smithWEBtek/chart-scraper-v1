class Scrape < ApplicationRecord
 

	def self.charts
		albums = []
		charts = []
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/chord-charts")  
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page) 


# chart_title:
		# albums = parse.css(".chordchartalbum ul").css("li")
		# albums.each |album| do
		# 	album = Album.new(album_title = album.text)
		# 	albums<<album
		# end
		# => "Smooth R&B 1-1 A 90 bpm"
# chart_url:
		# parse.css(".chordchartalbum a")[0].attributes["href"].value
# "//d11yja69hmswbm.cloudfront.net/chordcharts/smoothrnb/1/Smooth R%26B 1-1 A 90 bpm.pdf"
	end

	def self.audio
		# scrape audio files
	end
end