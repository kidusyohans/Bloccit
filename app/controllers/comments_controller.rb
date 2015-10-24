class CommentsController < ApplicationController
  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
   
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    #@comment.topic = @topic
    #authorize @post
    #puts "*" * 15
    #puts @comment.inspect
    #@comment = Comment.new( comment_params )
    #@comment.post = @post
    @new_comment = Comment.new
    if @comment.save
      flash[:notice] = "Comment saved successfully."
    else
      flash[:error] = "Comment failed to save."

    end 
    
    respond_to do |f|
      f.html
      f.js
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
