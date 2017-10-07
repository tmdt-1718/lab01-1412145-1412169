class PhotosController < ApplicationController
	before_action :logged_in_account, only: [:new, :create, :update, :destroy, :edit]
    before_action :correct_account, only: [:create, :update, :edit]

	impressionist

	def show
		@album = Album.find(params[:album_id])
		@photo = Photo.find params[:id]
		if (@album.viewcount != nil)
			@album.viewcount = @album.viewcount + 1
		else
			@album.viewcount = 1
		end
	end

	def new
		@album = Album.find(params[:album_id])
		@photo = Photo.new
	end

	def create

		if logged_in?
    		if current_account.fullname == @album.creator
	    		@photo = Photo.new(urlimg: params[:photo][:urlimg],creator: current_account.fullname, viewcount: 0, album_id: @album.id)
	        	@photo.save
	    		redirect_to album_path(@album)
	    	end
	    end
	end

	def destroy
  	  # if current_account.fullname != @album.creator
	  	  	@album = Album.find(params[:album_id])
			@photo = @album.photos.find(params[:id])
		  	@photo.destroy
		  	redirect_to album_path(@album)
   	 #   else
   	 #   		redirect_to album_path(@album)
     #  		flash[:notice] = "You can not delete this photo."
     #  end
	end

	private
    def photo_params
      params.require(:photo).permit(:urlimg)
    end

    def index
    end

    # Confirms a logged-in account.
  	def logged_in_account
      unless logged_in?
      redirect_to login_path
      end
  	end

  	# Confirms the correct user.
  	def correct_account
      @album = Album.find(params[:album_id])
      if current_account.fullname != @album.creator
      	redirect_to(new_album_photo_path(@album))
      	flash[:notice] = "You can not add photo to this album."
      end
  	end

  	
end

