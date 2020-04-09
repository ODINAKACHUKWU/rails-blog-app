module Response
  # Handle all like controller related response
  def handle_like_response(type)
    if type
      @like_count = @reactions.likes.count
      @dislike_count = @reactions.dislikes.count
      respond_with(@like_count, @dislike_count)
    else
      @like_count = @reactions.likes.count
      @dislike_count = @reactions.dislikes.count
      respond_with(@like_count, @dislike_count)
    end
  end

  private

  # Respond with the given count values
  def respond_with(*object)
    respond_to do |format|
      format.js { render partial: 'reaction', object: object }
    end
  end
end