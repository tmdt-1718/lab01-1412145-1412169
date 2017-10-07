class AlbumsController < ApplicationController
  impressionist 
  def index
    @albums = Album.order(created_at: :desc).all
    @albums.each do |album|
      album.viewcount = count_total_view_of_album (album)
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order(created_at: :desc).all
    impressionist(@album)
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

      
  def count_total_view_of_album (album)
     @sum_view = 0
     @photos = album.photos.all
     @photos.each do |photo|
     if (photo.viewcount != nil)
        @sum_view = @sum_view + photo.viewcount
     end
     return @sum_view
     end
  end

end