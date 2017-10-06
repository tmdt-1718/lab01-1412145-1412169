class HomeController < ApplicationController
  def index
  	@photos = Photo.order(created_at: :desc).limit(4) 
  	@posts = Post.order(created_at: :desc).all.limit(5)
  end


end
