class StaticPagesController < ApplicationController
	before_filter :authenticate_user!

	def donor_home
	end
end
