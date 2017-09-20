class Album < ApplicationRecord
	belongs_to :genre
	has_many :tracks
	has_many :charts
	
	def self.reset
		Album.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('albums')
	end
end
