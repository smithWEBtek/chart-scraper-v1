class Scrape < ApplicationRecord
	
	def self.genres
		@genre_urls = []
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/genres")
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
		genres = parse.css(".has-drop.active a").each do |element|
			genre_title = element.text
			new_genre = Genre.find_or_create_by(title: genre_title)

			url_prefix = "http://www.coffeebreakgrooves.com/"
			url_suffix	element.attributes["href"].value
			full_url = url_prefix + url_suffix

			new_genre.url = full_url
			new_genre.save
 
		end	
	end

	def self.scrape_albums
		scraped_albums = []
		genre_title = ''
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/chord-charts")  
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page) 
		
		albums = parse.css(".chordchartalbum ul").css("li")
		albums.each do |album|
			new_album = Album.find_or_create_by(title: album.elements.text)
			genre_title = parse.css(".chordchartalbum ul").css("li a").attr("href").value.split('/')[4]
			genre = Genre.find_or_create_by(title: genre_title) 
			genre.save
			new_album.genre_id = genre.id 
			new_album.save
			scraped_albums << new_album
		end
	end
	
	
 # URLS
 # http://www.coffeebreakgrooves.com/genres/smooth-rnb/2
 # append number to get next album
 # each album has a zip file to download charts for that album


 def self.audio
		# scrape audio files
	end
end