class CommentsController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_article, only: [:show, :create]

  # GET /posts/:article_id/comments/show
  def show
    @comments = @article.comments.order(created_at: :desc)
  end

  # POST /posts/:article_id/comments/show
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_path(@article)
    end
  end

  private

  # Get the article that is commented on
  def get_article
    @article = Article.find(params[:article_id])
  end

  # Comment parameters
  def comment_params
    params.permit(:article_id, :comment).merge(user_id: current_user.id)
  end
end
