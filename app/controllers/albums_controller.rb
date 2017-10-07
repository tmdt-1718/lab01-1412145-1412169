class AlbumsController < ApplicationController
    before_action :logged_in_account, only: [:new, :create, :update, :destroy, :edit]
    before_action :correct_account, only: [ :update, :destroy, :edit]

  def index
    @albums = Album.order(created_at: :desc).all
    @albums.each do |album|
      album.viewcount = count_total_view_of_album (album)
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order(created_at: :desc).all
  end

  def new
  	@album = Album.new
  end
 
  def create    
    if logged_in?
            @album = Album.new(title: params[:album][:title], description: params[:album][:description], urlimg: params[:album][:urlimg], creator: current_account.fullname, viewcount: 0)
            @album.save
            redirect_to @album
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
      end
     return @sum_view
  end


  # Confirms a logged-in account.
  def logged_in_account
      unless logged_in?
      redirect_to login_path
      end
  end

  # Confirms the correct user.
  def correct_account
      @albums = Album.find(params[:album_id])
      redirect_to(root_path) unless current_account.fullname == @album.creator
  end

end

