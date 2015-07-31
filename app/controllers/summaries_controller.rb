class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summaries.new(summary_params)
    
    if @summary.save
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "There was a problem saving your summary"
      render :new
    end
  end

  def show
    @summary = Summary.find(params[:id])
  end

  def edit
    @summary = Summary.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    if @summary.update_attributes(summary_params)
      redirect_to [@topic, @post, @summary], notice: "Summary updated!"
    else
      flash[:error]= "Summary failed to update"
      render :edit
    end
  end
  
  private
  
  def summary_params
    params.require(:summary).permit(:body)
  end
end
