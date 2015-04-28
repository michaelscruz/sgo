class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :terms_of_use)
    }
  end

  protected

  # Devise override
  def after_sign_in_path_for(user)
  	if user.is_a?(SchoolAdmin)
      # TODO: route to correct action
  	elsif user.is_a?(Donor)
      donations_path
  	elsif user.is_a?(Dor)
      # TODO: route to correct action
  	elsif user.is_a?(Household)
      household_root_path
  	end
  end  		
end
