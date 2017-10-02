class PostsController < ApplicationController
    def new
    end

    def create
        render plain: params[:post].inspect
    end

    def show
    end
    
    def index
    end
end
