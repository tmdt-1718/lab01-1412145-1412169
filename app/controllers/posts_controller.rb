class PostsController < ApplicationController
    before_action :logged_in_account, only: [:new, :create, :update, :destroy, :edit]
    before_action :correct_account, only: [:update, :destroy, :edit]

    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        if logged_in?
            @post = Post.new(username: current_account.fullname, title: params[:post][:title], content: params[:post][:content], viewcount: 0, urlimg: current_account.avatar)
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

        if @post.urlimg
        else
            @post.update(urlimg: "https://openclipart.org/image/2400px/svg_to_png/247319/abstract-user-flat-3.png")
        end

        count = @post.viewcount
        
        @post.update(viewcount: (count+1))
    end
    
    def index
        @post = Post.all
    end

    def getviewcount
        @post = Post.find(params[:id])
        render plain: @post.viewcount
    end

    private
        def post_params
            params.require(:post).permit(:username, :title, :content)
        end

        # Confirms a logged-in account.
        def logged_in_account
            unless logged_in?
            redirect_to login_path
            end
        end

        # Confirms the correct user.
        def correct_account
            @post = Post.find(params[:id])
            redirect_to(root_path) unless current_account.fullname == @post.username


            # @account = Account.find(params[:id])
            # redirect_to(root_path) unless current_account == @account
        end
end
