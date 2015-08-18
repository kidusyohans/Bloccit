class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment saved successfully."
    else
      redirect_to [@topic, @post], notice: "Comment failed to save."
    end 
  end 
  
  def show
  authorize @comments
  end
  
  private
  
  def comment_param
    params.require(:comment).permit(:body)
  
  end
end
