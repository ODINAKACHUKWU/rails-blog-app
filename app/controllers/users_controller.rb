class UsersController < ApplicationController
  # Callbacks
  before_action :authenticate
  before_action :get_user, only: [:edit, :update, :profile]

  # GET /:first_name/profile
  def profile
    @articles = @user.articles.published
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

  private

  # Get a user using firstname
  def get_user
    @user = User.find_by(first_name: params[:first_name])
  end

  def update_profile_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :avatar_url, :gender, :phone_number, :biography)
  end
end
