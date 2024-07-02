class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    if params[:id] == "sign_out"
      redirect_to root_path, alert: "Invalid user ID"
    else
      @user = User.find(params[:id])
    end
  end

  # Additional method to show the current user's profile
  def profile
    @user = current_user
    render :show
  end
end

  