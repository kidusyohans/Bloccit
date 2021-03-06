class Topics::PostsController < ApplicationController
  
  
    
      
  def index
    @posts = Post.all
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
    @comments = @post.comments
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    authorize @post
    #raise # this will short-circuit the method
    if @post.save_with_initial_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
    
    def destroy
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
      authorize @post
      
      if @post.destroy
        flash[:notice] = "\"#{@post.title}\" was deleted successfully."
        redirect_to @topic
      else
        flash[:error] = "There was an error deleting the post."
        render :show
      end
    end
  end
  
class PostsController < ApplicationController
   def index
     @posts = Post.visible_to(current_user).where("posts.created_at > ?", 7.days.ago).paginate(page: params[:page], per_page: 10)
   end
end
  
  private
  
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end
