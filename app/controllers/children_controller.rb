class ChildrenController < ApplicationController
	before_action :authenticate_user!

	def new
		@child = Child.new
	end

	def edit
		@child = Child.find(params[:id])
	end

	private

	def child_params
		params.require(:child).permit(:first_name, :last_name, :dob)
	end
	
end