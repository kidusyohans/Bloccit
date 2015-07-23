class PostsController < ApplicationController
  
  
  before_action :flash_attack
    
    private
    
    def flash_attack
      unless flash_attack?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
      end
    end
    
    skip_before_action :require_login, only: [:new, :index ]
      
end
      
    
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    #raise # this will short-circuit the method
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
    
end
