class PostsController < ApplicationController


    def index 
        @posts = Post.all 
    end
    
    def new 
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post = Post.new
    end 
    
    def create 
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end
    
    def show 
        @post = Post.find(params[:id])
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
    
        redirect_to post_path(@post)
    end

    def like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save

        redirect_to post_path
    end



    private
    
    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

end