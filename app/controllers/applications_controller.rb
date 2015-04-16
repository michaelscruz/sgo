class ApplicationsController < InheritedResources::Base
	before_filter :authenticate_user!

	def index
		@household = current_user
	end

  private

  def application_params
    params.require(:application).permit(:school_id, :applicant_id, :requested_amount)
  end
end

