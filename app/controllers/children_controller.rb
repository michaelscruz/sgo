class ChildrenController < ApplicationController
	def new
		@child = Child.new
	end
end