class GenresController < ApplicationController
 	before_action :set_genre, only:[:show, :edit, :update, :destroy]
	
	 def index
		@genres = Genre.all
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
	
	private
	def set_genre
		@genre = Genre.find(params[:id])
	end
end
