module SessionsHelper
  # Check whether the active page is either of login or signup 
  def authentication_page?
    url_for == '/signup' || url_for == '/login'
  end

  # Checks whether the current user has an avatar uploaded
  def user_avatar?
    current_user.avatar_url.present?
  end

  # Returns the avatar url of the current user
  def avatar
    current_user.avatar_url.to_s
  end
end
