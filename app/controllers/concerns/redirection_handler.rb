module RedirectionHandler
  def handle_redirection(object)
    if object.published
      redirect_to my_published_path
    else
      redirect_to my_drafts_path
    end
  end
end