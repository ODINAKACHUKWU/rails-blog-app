module Response
  # Handle all follow controller related response
  def handle_follow_response_with(follow)
    @follow = follow
    respond_to do |format|
      format.js { render partial: 'follow', object: @follow }
    end
  end
end