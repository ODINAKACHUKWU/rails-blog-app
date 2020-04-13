class UsersController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_user, only: [:edit, :update, :profile, :author_profile, :followers, :following, :author_followers, :author_following]
  before_action :get_user_profile_details, only: [:profile, :followers, :following, :author_profile, :author_followers, :author_following]

  # GET /:first_name/profile
  def profile; end

  # GET /users/:first_name/profile
  def author_profile
    @follow = @user.users_following
  end

  # GET /users/:first_name/followers 
  def author_followers
    @follow = @user.followed_authors
  end

  # GET /users/:first_name/following
  def author_following
    @follow = @user.users_following
  end

  # GET /:first_name/profile/edit
  def edit; end

  # PATCH /:first_name/profile/edit
  def update
    if @user.update(update_profile_params)
      user_redirection(@user.first_name)
    else
      render :edit
    end
  end

  # GET /:first_name/followers 
  def followers
    @follow = @user.followed_authors
  end

  # GET /:first_name/following
  def following
    @follow = @user.users_following
  end

  private

  # Get a user's followers and followings
  def get_user_profile_details
    @articles = @user.articles.published
    @followers = @user.followers
    @following = @user.followings
  end

  # Get a user using firstname
  def get_user
    @user = User.find_by(first_name: params[:first_name])
  end

  # Parameters for updating user's profile
  def update_profile_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :avatar_url, :gender, :phone_number, :biography)
  end
end
