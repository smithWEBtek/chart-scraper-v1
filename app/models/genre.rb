class Genre < ApplicationRecord
	has_many :albums

	def self.reset
		Genre.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('genres')
	end
end