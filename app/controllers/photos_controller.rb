class PhotosController < ApplicationController
	def show
		@photo = Photo.find params[:id]
	end

	def new
		@photo = Photo.new
	end

	def create
		@album = Album.find(params[:album_id])
    	@photo = @album.photos.create(photo_params)
    	redirect_to album_path(@album)
	end

	private
    def photo_params
      params.require(:photo).permit(:urlimg)
    end
end
