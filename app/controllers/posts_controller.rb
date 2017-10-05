class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        if logged_in?
            @post = Post.new(username: current_account.fullname, title: params[:post][:title], content: params[:post][:content], viewcount: 0)
        else
            @post = Post.new(username: "Demo1", title: params[:post][:title], content: params[:post][:content], viewcount: 0)
        end

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

        count = @post.viewcount
        
        @post.update(viewcount: (count+1))
    end
    
    def index
        @post = Post.all
    end

    private
        def post_params
            params.require(:post).permit(:username, :title, :content)
        end
end
