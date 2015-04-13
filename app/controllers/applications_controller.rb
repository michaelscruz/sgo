class ApplicationsController < InheritedResources::Base

  private

  def application_params
    params.require(:application).permit(:school_id, :applicant_id, :requested_amount)
  end
end

