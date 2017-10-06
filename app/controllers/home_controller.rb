class HomeController < ApplicationController
  def index
  	@photos = Photo.order(created_at: :desc).limit(8) 
  	@posts = Post.order(created_at: :desc).all.limit(5)
  end


end
