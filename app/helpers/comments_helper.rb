module CommentsHelper
  # Check whether the active page is comments page
  def comment_page?
    url_for.include?('comments') && url_for.include?('show')
  end
end
