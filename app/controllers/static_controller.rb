class StaticController < ApplicationController
	def home
		render 'static/home'
	end
	
	def reset
		Genre.reset_all
		redirect_to '/'
	end

	def scrape
		Genre.scrape
		redirect_to '/'
	end
end
