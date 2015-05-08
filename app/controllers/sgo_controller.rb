class SgoController < ApplicationController
	before_filter :authenticate_user!

	def root
	end

	def applications
		@applications = Application.all.sort_by {|a| a.pending_sgo? ? 0 : 1}
	end

	def show_application
		@application = Application.find(params[:id])
	end

	def confirm_application
		@application = Application.find(params[:id])
		set_application_defaults
	end

	def update_application
		@application = Application.find(params[:id])
		@application.sgo_application = true

		if @application.update_attributes(application_params)
			@application.sgo_confirm!(current_user)
			redirect_to sgo_applications_path
		else
			render :confirm_application
		end
	end

	private

	def application_params
		params.require(:application).permit(:scholarship_approved, :approved_by_initials, :approved_date)
	end

	def set_application_defaults
		@application.approved_by_initials ||= current_user.initials
		@application.approved_date ||= Date.today
	end
end