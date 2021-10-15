class ArtistsController < ApplicationController
    def new
      @artists = Artist.new
    end
  
    def create
        @artist = Artist.new
        @artist.name = params[:name]
        @artist.bio = params[:bio]
        @artist.save
        redirect_to artist_path(@artist)
    end
  
    def edit
      @artist = Artist.find(params[:id])
    end
  
    def update
        @artist = Artist.find(params[:id])  
        @artist.update(params.require(:artist).permit(:name, :bio))
        redirect_to artist_path(@artist)
    end
  
    def destroy
    end
  
    def index
      @artists = Artist.all
    end
  
    def show
      @artist = Artist.find(params[:id])
    end


  private
	 
  def artist_params(*args)
      params.require(:artist).permit(*args)
  end

  
  end
  