class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
   
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.topic = @topic
    authorize @post
    #puts "*" * 15
    #puts @comment.inspect
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment saved successfully."
    else
      redirect_to [@topic, @post], notice: "Comment failed to save."
      render :new
    end 
  end 
  
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      
    end
    
    respond_to do |format|
       format.html
       format.js
     end
    
  end
    
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  
  end
end
