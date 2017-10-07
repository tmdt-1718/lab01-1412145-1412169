class HomeController < ApplicationController
  def index
  	@photos = Photo.order(created_at: :desc).limit(6) 
  	@posts = Post.order(created_at: :desc).all.limit(8)
  end
end
