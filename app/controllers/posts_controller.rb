class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        @post = Post.new(username: "Demo1", title: params[:post][:title], content: params[:post][:content])

        @post.save
        redirect_to @post
    end

    def update
        @post = Post.find(params[:id])
       
        @post.update(title: params[:post][:title], content: params[:post][:content])
        redirect_to @post
    end


    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
    end
    
    def index
        @post = Post.all
    end

    private
        def post_params
            params.require(:post).permit(:username, :title, :content)
        end
end
