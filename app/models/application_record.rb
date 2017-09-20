class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true
	
	def self.reset_all
		Genre.reset 
		Album.reset
	end

	def self.scrape 
		Scrape.import
	end
end
