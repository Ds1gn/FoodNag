class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  attr_accessor :ingredient

  before_filter :configure_devise_parameters, if: :devise_controller?

	protected

	def configure_devise_parameters
		devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :phone, :zip]
		devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :phone, :zip]
	end

end
