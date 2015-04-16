class HouseholdsController < ApplicationController
	before_action :authenticate_user!

	def index
		@household = current_user
	end

	def edit
	end
end