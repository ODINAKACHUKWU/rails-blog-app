module HomeHelper
  # Checks whether the active page if homepage
  def home_page?
    request.original_url.split(request.base_url + '/').none?
  end
end
