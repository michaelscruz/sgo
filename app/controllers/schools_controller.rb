class SchoolsController < ApplicationController
	def landing
		@school = School.find(params[:id])
	end
end