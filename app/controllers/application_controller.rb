class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :photo, :password, :password_confirmation, :profession_id])
    update_attrs = [:email, :photo, :password, :password_confirmation, :current_password, :profession_id]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
