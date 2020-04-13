module UsersHelper
  # Return avatar string
  def avatar(object)
    object.avatar_url.to_s
  end

  # Return full name
  def profile_name(object)
    "#{object.first_name} #{object.last_name}"
  end

  # Check whether the active page is user profile edit page
  def edit_profile_page?
    url_for.include?('profile') && url_for.include?('edit')
  end

  # Check whether the active page is profile view page
  def profile_page?
    url_for.include?('profile') || url_for.include?('followers') || url_for.include?('following')
  end
end
