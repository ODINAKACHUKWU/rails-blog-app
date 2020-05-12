class ArticlesController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_article, only: [:show, :modal, :publish, :edit, :preview, :update, :destroy]

  # GET /new-post
  def new
    @article = Article.new
  end

  # GET /me/posts/:slug
  def modal; end

  # GET /:first_name/:slug (post_path) || GET /me/:slug (my_post_path)
  def show
    # [todo]: Note that this @articles would be trending articles
    @articles = Article.published.first(3)
    @likes_count = @article.likes.count
    @comments_count = @article.comments.count
    @follow = @article.author.users_following.where(follower_id: current_user.id)
  end

  # GET /me/posts/:slug/edit
  def edit; end

  # PATCH /me/posts/:slug/edit
  def update
    if @article.update(update_article_params)
      article_redirection(@article)
    else
      render :edit
    end
  end

  # PATCH /me/posts/:slug/publish
  def publish
    if @article.update(published: true, published_at: Time.now)
      article_redirection(@article)
    else
      render :preview
    end
  end

  # GET /me/posts/:slug/preview
  def preview; end

  # GET /me/posts/drafts
  def draft_posts
    @articles = current_user.articles.drafts
  end

  # GET /me/posts/published
  def published_posts
    @articles = current_user.articles.published
  end

  # POST /new-post
  def create
    @article = Article.new(article_params)
    if @article.save
      article_redirection(@article)
    else
      render :new
    end
  end

  # DELETE /me/posts/:slug
  def destroy
    @article.destroy
    article_redirection(@article)
  end

  private

  # Get an article using the slug
  def get_article
    @article = Article.find_by(slug: params[:slug])
  end

  # Update article parameters
  def update_article_params
    permitted_params = params.require(:article).permit(:title, :content, :image_url)
    new_image = permitted_params[:image_url]
    permitted_params[:image_url] = @article.image_url unless new_image.present?
    if params[:commit] == 'Publish'
      permitted_params[:published] = true
      permitted_params[:published_at] = Time.now
    end
    permitted_params
  end

  # Create new article parameters
  def article_params
    permitted_params = params.require(:article).permit(:title, :content, :image_url).merge(user_id: current_user.id)
    if params[:commit] == 'Publish'
      permitted_params[:published] = true
      permitted_params[:published_at] = Time.now
    end
    permitted_params
  end
end
