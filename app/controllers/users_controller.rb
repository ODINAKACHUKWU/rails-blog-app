class UsersController < ApplicationController
  before_action :authenticate

  def new
    @user = User.new
  end
end
