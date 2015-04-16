class HouseholdsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_household

	def root
	end

	def applications
	end

	def new_application
		@application = Application.new()
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
		params.require(:application).permit(:school_id)
	end
end