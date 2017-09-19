class AlbumsController < ApplicationController

	def index
		@albums = album.all 
	end

	def show
		@album = album.find_by_id(params[:id])
	end

	def new
		@album = Album.new 
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			flash[:message] = 'album created.'
			redirect_to album_path(@album)
		else
			render :new
		end
	end

	def edit
		@album = Album.find_by_id(params[:id])
	end

	def update
		@album = Album.find_by_id(params[:id])
		@album.update(album_params)
		if @album.save
			flash[:message] = 'album updated.'
			redirect_to album_path(@album)
		else
			render :edit
		end
	end

	def destroy
		@album = Album.find_by_id(params[:id])
		@album.destroy
		redirect_to albums_path
	end

	private
	def album_params
		params.require(:album).permit(:name, :location)
	end
end
