class AlbumsController < ApplicationController
	def index
		@album = Album.all
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
	end

	def create
	  @album = Album.new(album_params)
	 
	  @album.save
	  redirect_to @album
	end
	 
	private
	  def album_params
	    params.require(:album).permit(:title, :description, :urlimg)
	end
end
