class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, :first_name, :last_name)
    }
  end

  protected

  # Devise override
  def after_sign_in_path_for(user)
  	if user.school_admin?
  		school_applications_path
  	elsif user.donor?
  		donations_path
  	elsif user.dor?
  		'/dor/donations'
  	elsif user.household?
  		household_root_path
  	end
  end  		
end
