class ApplicationsController < ApplicationController
  def index
    @applications = ApplicationRecord.includes(:user, :dog).all
  end

  def show
    @application = Application.find(params[:id])
  end
end
