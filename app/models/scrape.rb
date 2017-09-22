class Scrape < ApplicationRecord
	
	def self.import
		Scrape.genres
		Scrape.albums
	end

	def self.genres
		file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/genres")
		page = HTTParty.get(file)
		parse = Nokogiri::HTML(page)
		genres = parse.css(".has-drop.active a").drop(1).each do |element|
			genre_title = element.text
			genre_slug = element.attributes["href"].value.split("/")[2]
			new_genre = Genre.find_or_create_by(title: genre_title)
			new_genre.genre_slug = genre_slug
			new_genre.url = "http://www.coffeebreakgrooves.com/genres/" + genre_slug 
			new_genre.save
		end
	end
 
	def self.albums
		@genre_urls = []
		@album_numbers = []
		Genre.all.each{|g|@genre_urls.push(g.url)}

		@genre_urls.each do |url|
			file = Nokogiri::HTML(url)
			page = HTTParty.get(file)
			parse = Nokogiri::HTML(page)			

			genre_slug = url.split("/").last
			@genre = Genre.find_by(genre_slug: genre_slug)
			
			parse.css(".product-item").drop(1).each do |item|			
				number = item.elements[0].attributes["album-number"].value
				@album_numbers << number 
 
				album_title = item.css("a span").text
				album = Album.find_or_create_by(title: item.text)

				album.genre_id = @genre.id
				album_url = url + "#{number}"
				album.album_number = number 
				album.save 
			end 
 		end
	end

# 		@genre_albums_charts_zips = []
# # for each top level genre url, get all album urls
# 		@genre_urls.each do |url|
# 			file = Nokogiri::HTML(url)
# 			page = HTTParty.get(file)
# 			parse = Nokogiri::HTML(page)
# 		@genre_albums_charts_zips = []

# # for each album url, get charts_zip url
# # collect all chart_zip_urls in an array 
# # download each zip file
# # unzip each file into Dropbox folder

# 		@chart_zip_urls << parse.css("#btn-chordcharts")[0].attributes["href"].value
# 		end
# 		@chart_zip_urls
# 	end
	


	# def self.scrape_albums
	# 	scraped_albums = []
	# 	genre_title = ''
	# 	file = Nokogiri::HTML("http://www.coffeebreakgrooves.com/chord-charts")  
	# 	page = HTTParty.get(file)
	# 	parse = Nokogiri::HTML(page) 
		
	# 	albums = parse.css(".chordchartalbum ul").css("li")
	# 	albums.each do |album|
	# 		new_album = Album.find_or_create_by(title: album.elements.text)
	# 		genre_title = parse.css(".chordchartalbum ul").css("li a").attr("href").value.split('/')[4]
	# 		genre = Genre.find_or_create_by(title: genre_title) 
	# 		genre.save
	# 		new_album.genre_id = genre.id 
	# 		new_album.save
	# 		scraped_albums << new_album
	# 	end
	# end
	
	
 # URLS
 # http://www.coffeebreakgrooves.com/genres/smooth-rnb/2
 # append number to get next album
 # each album has a zip file to download charts for that album


#  def self.audio
# 		# scrape audio files
# 	end



# ###################   wedding song scraper

 

  def self.songs
    file = Nokogiri::HTML("https://www.theknot.com/content/best-wedding-songs")
    page = HTTParty.get(file)
    parse = Nokogiri::HTML(page)
    categories = parse.css(".slide-caption li")
    categories.each do |element|
      category = Category.find_or_create_by(name: element.css("span").text)
      category.save 
    end
    binding.pry
  end
end