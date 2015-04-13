class HouseholdsController < ApplicationController
	before_action :authenticate_user!

	def index
		@household = current_user.household
	end

	def edit
		@household = Household.find(params[:id])
	end
	
end