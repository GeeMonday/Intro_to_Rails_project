class ApplicationsController < ApplicationController
  def index
    @applications = Application.includes(:user, :dog).all
  end

  def show
    @application = Application.find(params[:id])
  end
end
