class ApplicationsController < ApplicationController
  def index
    @applications = Application.includes(:user, :dog).all
  end
end
