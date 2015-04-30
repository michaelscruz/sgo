class ApplicationsController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@applications = Application.all
	end

private

	def application_params
		params.require(:application).permit(:school_id, :applicant_id, :requested_amount, :requested_amount, :parent_first_name, :parent_last_name, :parent_middle_initial, :apartment_number, :city, :zip)
	end
end

