class SongsController < ApplicationController
    def new
      @songs = Song.new
    end
  
    def create
        @song = SOng.new
        @song.name = params[:name]
        @song.artist_id = params[:artist_id]
        @song.genre_id = params[:genre_id]
        @song.save
        redirect_to song_path(@song)
    end
  
    def edit
        @song = Song.find(params[:id])
    end
  
    def update
        @song = song.find(params[:id])  
        @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
  
    def destroy
    end
  
    def index
      @songs = Song.all
    end
  
    def show
      @song = Song.find(params[:id])
    end

     
	def song_params(*args)
		params.require(:song).permit(*args)
	end
    
  end
  