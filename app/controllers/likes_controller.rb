class LikesController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :set_like, only: :like
  before_action :set_article, only: :like

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

  # Deletes the like record in the database
  def handle_reaction_update
    if @like.destroy
      @likes_count = @article.likes.count
      respond_to do |format|
        format.js { render partial: 'reaction', object: @likes_count }
      end
    end
  end

  # Creates a new like record in the database
  def create_reaction
    @like = Like.new(user_id: current_user.id, article_id: params[:article_id])
    if @like.save
      @likes_count = @article.likes.count
      respond_to do |format|
        format.js { render partial: 'reaction', object: @likes_count }
      end
    end
  end

  # Return the article on which like action is executed
  def set_article
    @article = Article.find(params[:article_id])
  end

  # Return a like object if it exists
  def set_like
    @like = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
  end
end
