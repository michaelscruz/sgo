class DisbursementsController < InheritedResources::Base

  private

    def disbursement_params
      params.require(:disbursement).permit(:disburse_date, :amount, :type, :awards, :status)
    end
end

