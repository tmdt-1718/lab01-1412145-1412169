class AlbumsController < ApplicationController

  def index
    @albums = Album.order(created_at: :desc).all

  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order(created_at: :desc).all
  end

  def new
  	@album = Album.new
  end
 
  def create
	  @album = Album.new(album_params)
	 
	  if @album.save
	  	redirect_to @album
	  else
	  	render 'new'
	  end
  end
 
  private
  def album_params
    params.require(:album).permit(:title, :description, :urlimg)
  end
end