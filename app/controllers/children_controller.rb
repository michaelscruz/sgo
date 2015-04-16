class ChildrenController < ApplicationController
	before_action :authenticate_user!
	before_action :set_household

	def index
	end

	def new
		@child = Child.new
	end

	def edit
		@child = Child.find(params[:id])
	end

	def create
		@child = @household.children.new(child_params)

		if @child.save
			redirect_to household_children_path(@household)
		else
			render :new
		end
	end

	def update
		@child = Child.find(params[:id])

		if @child.update_attributes(child_params)
			redirect_to household_children_path(@household)
		else
			render :edit
		end
	end

	private

	def set_household
		@household = current_user
	end

	def child_params
		params.require(:child).permit(:first_name, :last_name, :dob)
	end
	
end