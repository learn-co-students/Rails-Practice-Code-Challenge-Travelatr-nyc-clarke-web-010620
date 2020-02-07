class BloggersController < ApplicationController
before_action :find_blogger, only: [:show,:edit,:update,:destroy] 

def index 
  @bloggers = Blogger.all  
end

def show 
 @total_likes = @blogger.total_likes
end 

def new
  @blogger = Blogger.new
  @errors = flash[:errors]
end

def create 
  @blogger = Blogger.create(blogger_params)
  
  if @blogger.valid? 
    redirect_to blogger_path(@blogger)
  else 
    flash[:errors] = @blogger.errors.full_messages
    redirect_to new_blogger_path 
  end
end

def edit 

end 

 def update
  @blogger = Blogger.update(blogger_params)

  redirect_to blogger_path(@blogger)
 end 

def destroy
  @blogger.destroy
  redirect_to bloggers_path
end

private 

def blogger_params 
  # byebug
  params.require(:blogger).permit(:name,:bio,:age)
end 

def find_blogger
  @blogger = Blogger.all.find(params[:id])
end 

end
