module RedirectionHandler
  # Handle all article controller related redirection
  def article_redirection(object)
    if object.published
      redirect_to my_published_path
    else
      redirect_to my_drafts_path
    end
  end

  # Handle all user controller related redirection
  def user_redirection(user)
    redirect_to profile_path(user)
  end
end