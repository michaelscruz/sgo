class HouseholdsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_household

	def root
	end

	def applications
	end

	def new_application
		@application = Application.new()
		@application.applicants.build
		@application.application_files.build
		set_application_defaults
	end

	def create_application
		@application = Application.new(application_params)

		if @application.save
			redirect_to applications_household_path(@household)
		else
			render :new_application
		end
	end

	def edit
	end

	private

	def set_household
		@household = current_user
	end

	def application_params
		params.require(:application).permit(
			:school_id, 
			:requested_amount, 
			:parent_first_name, 
			:parent_last_name, 
			:parent_middle_initial, 
			:email, 
			:confirm_email, 
			:phone, 
			:address,
			:apartment_number, 
			:city,
			:state, 
			:zip,
			:applicants_attributes => [
				:child_id,
				:grade,
				:relationship_to_applicant,
				:public_school,
				:public_school_grade,
				:tax_credit_scholarship,
				:tax_credit_scholarship_grade,
				:address, 
				:apartment_number, 
				:city, 
				:state,
				:zip,
			]
		)
	end

	def set_application_defaults
		@application.parent_first_name ||= current_user.first_name
		@application.parent_last_name ||= current_user.last_name
		@application.email ||= current_user.email
		@application.state ||= "IN"
		@application.applicants.each do |a|
			a.state ||= "IN"
		end
	end
end