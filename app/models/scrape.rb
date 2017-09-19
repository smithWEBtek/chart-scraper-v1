class Scrape < ApplicationRecord
	
	# get Genres and genre_urls
	def self.genres
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/genres")
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
		genres = parse.css(".has-drop.active a").drop(1).each do |element|
			
binding.pry 

			genre_title = element.text
			genre_slug = parse.css(".has-drop.active a").drop(1)
			new_genre = Genre.find_or_create_by(title: genre_title)
			new_genre.genre_slug = genre_slug
			new_genre.save
		end	
	end

	# Genre, icons, chord-charts




	# return array of zip file urls, one for each genre/album
	def self.chart_zip_urls
		@genre_urls = []
		Genre.all.each{|g|@genre_urls.push(g.url)}

		@chart_zip_urls = []
		Genre.all.each do |genre|
			file = Nokogiri::HTML(genre.url)
			page = HTTParty.get(file)
			parse = Nokogiri::HTML(page)
			@chart_zip_urls << parse.css("#btn-chordcharts")[0].attributes["href"].value
		end
		@chart_zip_urls
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