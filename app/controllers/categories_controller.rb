class CategoriesController < WorkflowController
	def index
		@categories = Category.all
	end
end