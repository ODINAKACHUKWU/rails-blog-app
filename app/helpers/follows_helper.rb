module FollowsHelper
  # Handles the text that displays on the Follow button on show article page
  def follow_button_text(object)
    if object.present?
      "Following"
    else
      "Follow"
    end
  end

  # Handles the text that displays on the Follow button on Followers page
  def profile_follower_button_text(object, id)
    following = object.select { |follow| follow.author_id == id }
    if following.present?
      "Following"
    else
      "Follow"
    end
  end

  # Returns link path for an author's follower
  def sort_link_path(object)
    if object == current_user
      profile_path(current_user.first_name)
    else
      user_profile_path(object.first_name)
    end
  end
end
