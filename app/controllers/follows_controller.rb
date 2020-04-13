class FollowsController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_follow, only: [:follow, :profile_follow]

  # [Todo]: Implement notification to user requesting to follow self

  # GET /users/:author_id/follow/:follower_id
  def follow
    unless follow_self_request?
      if @follow.nil?
        create_follow
      else
        delete_follow
      end
    end
  end

  private

   # Verify whether the user is requesting to follow self
  def follow_self_request?
    params[:author_id] == current_user.id
  end

  # Creates a new follow record in the database
  def create_follow
    @follow = Follow.new(author_id: params[:author_id], follower_id: current_user.id)
    if @follow.save
      handle_follow_response_with(true)
    end
  end

  # Delete a follow record from the database
  def delete_follow
    @follow.destroy
    handle_follow_response_with(false)
  end

  # Return a follow object if it exists
  def get_follow
    @follow = Follow.find_by(author_id: params[:author_id], follower_id: params[:follower_id])
  end
end
