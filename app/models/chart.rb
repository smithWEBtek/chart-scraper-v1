class Chart < ApplicationRecord
	belongs_to :genre
	belongs_to :album
	
end
