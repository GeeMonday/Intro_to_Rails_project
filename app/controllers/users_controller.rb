class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :profile]


  def index
    @users = User.all
  end

  def show
    logger.debug "Params: #{params.inspect}"
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
    render :show
  end
end
