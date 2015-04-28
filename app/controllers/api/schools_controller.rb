class Api::SchoolsController < ApplicationController
	def annual_tuition
		@school = School.find(params[:id])
	end
end