module ArticlesHelper
  # Check whether the active page is create article page 
  def create_article_page?
    url_for == '/new-post'
  end

  # Checks whether the active page is edit article page
  def edit_article_page?
    url_for.include?('posts') && url_for.include?('edit')
  end

  # Check whether the active is published or drafts articles page
  def show_posts_page?
    url_for == '/me/posts/drafts' || url_for == '/me/posts/published'
  end

  # Returns the sum total of published posts by the current user
  def published_count
    current_user.articles.published.count 
  end

  # Returns the sum total of drafts by the current user
  def draft_count
    current_user.articles.drafts.count
  end

  # Checks whether author of the article has a profile picture
  def author_avatar?
    @article.author.avatar_url.present?
  end

  # Displays the author's profile picture
  def author_avatar
    @article.author.avatar_url.to_s
  end

  # Returns author's fullname
  def author_full_name
    "#{@article.author.first_name} #{@article.author.last_name}"
  end

  # Format date of article publication
  def format_date(object)
    Date.strptime(object.to_s).to_formatted_s(:short_date)
  end

  # Format the read time of an article to be rendered
  def format_read_time(object)
    text = "- #{object.read_time} min read"
    if object.read_time < 1
      "- less than a min read"
    else
      text
    end    
  end

  # Alternate text for article's image
  def image_description
    @article.image_url.to_s.split('/').last
  end

  # Returns the image uploaded for an article
  def article_image
    @article.image_url.to_s
  end

  # Checks whether the author uploaded and image for an article
  def article_image?
    @article.image_url.present?
  end

  # Check whether an author updated his biography
  def biography?
    @article.author.biography.present?
  end
end
