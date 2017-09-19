class Album < ApplicationRecord
	belongs_to :genre
	has_many :tracks
	has_many :charts
	
end
