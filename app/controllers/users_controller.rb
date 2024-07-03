class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :profile]

  def index
    @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  # Additional method to show the current user's profile
  def profile
    @user = current_user
    render :show
  end
end

  