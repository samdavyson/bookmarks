class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :null_session
 before_action :configure_devise_permitted_parameters, if: :devise_controller?
 #before_action :authenticate_user!, only: [:update]
# protected

  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation, :avatar, :about]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
     end
  end
end