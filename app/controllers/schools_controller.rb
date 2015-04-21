class SchoolsController < ApplicationController
	before_filter :authenticate_user!, :except => [:landing]
	before_action :set_school, :except => [:landing]

	def landing
		@school = School.find(params[:id])
	end

	def root
	end

	def applications
	end

	def new_application
		@application = Application.new
		@application.applicants.build
		@application.application_files.build
		set_application_defaults
	end

	def show_application
		@application = Application.find(params[:application_id])
	end

	def confirm_application
		@application = Application.find(params[:application_id])
		set_application_defaults
	end

	def update_application
		@application = Application.find(params[:application_id])
		@application.school_application = true

		if @application.update_attributes(application_params)
			@application.school_confirm!(current_user)
			redirect_to applications_school_path(@school)
		else
			render :confirm_application
		end
	end

	private

	def set_school
		@school = current_user.school
	end

	def application_params
		params.require(:application).permit(
			:school_official_first_name, 
			:school_official_last_name, 
			:school_official_email, 
			:school_official_confirm_email, 
			:school_official_phone, 
			:school_official_phone_ext,
			:information_verified,
			:third_party_income_verified,
			:choice_scholarship_income_verified,
			:document_income_verified,
			:tuition_for_application,
			:choice_scholarship_amount,
			:choice_scholarship_explanation
		)
	end

	def set_application_defaults
		@application.school_official_first_name ||= current_user.first_name
		@application.school_official_last_name ||= current_user.last_name
		@application.school_official_email ||= current_user.email
		@application.school_official_confirm_email ||= current_user.email
	end
end