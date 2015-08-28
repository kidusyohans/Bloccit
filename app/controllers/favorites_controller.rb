class FavoritesController < ApplicationController
	
	def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
 
     if favorite.save
  
       flash[:notice] = "favorite was saved."
      redirect_to [ @post]
     else
       redirect_to [@topic, @post], notice: "favorite failed to save."
      render :new
     end
	end
	
	def destroy
   @post = Post.find(params[:post_id])
 
   if favorite.destroy
     flash[:notice] = "favorite was removed."
      redirect_to [ @post]
   else
     flash[:error] = "favorite couldn't be deleted. Try again."
      redirect_to [ @post]
   end
	end
		
end
def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
end
