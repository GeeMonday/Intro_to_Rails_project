class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_permitted_parameters

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:new_username, :bio])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_username, :bio])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:new_username, :bio, :profile_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:new_username, :bio, :profile_photo])
  end
end
