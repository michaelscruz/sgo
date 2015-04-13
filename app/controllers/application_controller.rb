class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
  		new_application_path
  	end
  end  		
end
