class SessionsController < ApplicationController
  # GET /login 
  def new; end

  # GET /signup
  def new_signup; end
  
  # POST /signin
  def signin
    @user = User.where(email: params[:email]).first
  
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in successfully."
    else
      render :new, alert: "Invalid email or password!"
    end
  end
  
  # POST /signup
  def signup
    @user = User.new(user_params)
  
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed up successfully."
    else
      render :new_signup, alert: @user.errors.full_messages
    end
  end
  
  # GET /signout
  def signout
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully."
  end
  
  private
  
  # Sign up parameters
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
