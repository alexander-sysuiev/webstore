class WorkflowController < ApplicationController
	before_filter :get_categories

	def get_categories
		@categories = Category.all
	end
end