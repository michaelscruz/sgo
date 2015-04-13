class StaticPagesController < ApplicationController
	before_filter :authenticate_user!, :except => :landing_page

	def static_elements
	end

	def donor_home
	end

	def school_applications_home
	end

	def school_disbursements_home
	end

	def school_applications_new
	end

	def dor_donations_home
	end

	def landing_page
	end
end
