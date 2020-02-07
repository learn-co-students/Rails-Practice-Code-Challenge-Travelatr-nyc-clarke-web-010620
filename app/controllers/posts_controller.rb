class PostsController < ApplicationController
   before_action :find_post, only: [:show,:edit,:update,:like,:destroy]


  def index
    @posts = Post.all 
  end 

  def show

  end
  
  def new
   @post = Post.new 
   @bloggers = Blogger.all
   @destinations = Destination.all
   @errors = flash[:errors]
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else 
      flash[:errors] = @post.errors.full_messages
      redirerect to new_post_path
    end 
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
    @errors = flash[:errors]
  end
  
  def update
    @post.update(post_params)
    # byebug
    if @post.valid?
      redirect_to post_path(@post)
    else 
      flash[:errors] = @post.rails.full_messages
      redirerect to new_post_path
    end 
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def like 
  @post.like
  redirect_to post_path(@post)
  end 


  private 
  def find_post 
    @post = Post.find(params[:id])
  end 
 
  def post_params
    params.require(:post).permit(:title,:content,:blogger_id,:destination_id)
  end

end
