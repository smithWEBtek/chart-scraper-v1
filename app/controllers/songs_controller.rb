class SongsController < ApplicationController

    def add_songs
      song.add_songs
      redirect_to songs_path
    end
  
    def index
      @songs = Song.all 
    end
  
    def show
      @song = song.find_by_id(params[:id])
      song_full_path = Rails.root + "app/assets/songs/" + @song.name
      send_file(song_full_path, :filename => "@song.name.gsub('.song','')", :disposition => 'inline', :type => "application/song")
    end
  
    def new
      @song = Song.new 
    end
  
    def create
      @song = song.new(song_params)
      if @song.save
        flash[:message] = 'song created.'
        redirect_to song_path(@song)
      else
        render :new
      end
    end
  
    def edit
      @song = Song.find_by_id(params[:id])
    end
  
    def update
      @song = Song.find_by_id(params[:id])
      @song.update(song_params)
      if @song.save
        flash[:message] = 'song updated.'
        redirect_to song_path(@song)
      else
        render :edit
      end
    end
  
    def destroy
      @song = Song.find_by_id(params[:id])
      @song.destroy
      redirect_to songs_path
    end
  
    private
  
    def song_params
      params.require(:song).permit(:name, :location)
    end
  end
  
