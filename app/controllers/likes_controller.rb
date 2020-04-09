class LikesController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_like, only: :like
  before_action :get_reactions, only: :like

  # [Todo]: Implement notification to post owner trying to react (like/dislike) to his post

  # GET /posts/:article_id/like/:type
  def like
    unless post_owner?
      if @like.nil?
        create_reaction
      else
        handle_reaction_update
      end
    end
  end

  private

  # Verify whether the post is owned by the current user
  def post_owner?
    @article.author == current_user
  end

  # Converts the params[:type] string to boolean
  def convert_to_bolean(string)
    if string == "true"
      true
    else
      false
    end
  end

  # Updates the like field in the database to true/false
  def handle_reaction_update
    type = convert_to_bolean(params[:type])
    if @like.like == type
      @like.destroy
      handle_like_response(type)
    else
      @like.update(like: params[:type])
      handle_like_response(type)
    end
  end

  # Creates a new like record in the database
  def create_reaction
    @like = Like.new(user_id: current_user.id, article_id: params[:article_id], like: params[:type])
    if @like.save
      handle_like_response(convert_to_bolean(params[:type]))
    end
  end

  # Return all like reactions for the post
  def get_reactions
    @article = Article.find(params[:article_id])
    @reactions = @article.likes
  end

  # Return a like object if it exists
  def get_like
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
  end
end
