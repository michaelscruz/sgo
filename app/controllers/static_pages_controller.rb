class StaticPagesController < ApplicationController
	before_filter :authenticate_user!

	def static_elements
	end

	def donor_home
	end

	def school_applications_home
	end
end
