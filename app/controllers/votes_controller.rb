class VotesController < ApplicationController
  
  before_action :load_post_and_vote
  
  def up_vote
    @post = Post.find(params[:post_id])

    @vote = @post.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.votes.create(value: 1, post: @post)
    end

    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end
  
  private 
  
  def load_post_and_vote
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @vote = @post.votes.where(user_id: current_user.id).first
  end
  
  private
  
  def update_vote!(new_value)
    authorize @vote, :update?
    if @vote # if it exists, update it
      @vote.update_attribute(:value, new_value)
    else # create it
      @vote = current_user.votes.build(value: new_value, post: @post)
      authorize @vote, :create?
      @vote.save
    end
  end
end