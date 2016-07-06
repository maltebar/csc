class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :optout, :nickname, :notificationFrequency, :group_id])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :optout, :nickname, :notificationFrequency, :current_password, :group_id])
  end
end
