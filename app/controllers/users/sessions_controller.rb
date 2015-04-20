class Users::SessionsController < Devise::RegistrationsController
	def select_home
		authenticate_user!
		if current_user
			redirect_to after_sign_in_path_for(current_user)
		else
			redirect_to new_user_session_path
		end
	end
end
