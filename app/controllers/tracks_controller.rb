class TracksController < ApplicationController
	before_action :set_track, only:[:show, :edit, :update, :destroy]
	def index
		@tracks = Track.all
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
	def set_track
		@track = Track.find(params[:id])
	end
end
