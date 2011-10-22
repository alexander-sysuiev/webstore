class ServicesController < WorkflowController
	def index
		@category = Category.find_by_id params[:category_id]
		@services = @category.nil? ? Service.all : @category.services
	end

	def show
		@category = Category.find params[:category_id]
		@service = @category.services.find params[:id]
	end
end