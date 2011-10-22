class Admin::CategoriesController < Admin::BaseController
	
	def new
	end

	def create
		Category.create params[:category]
		redirect_to admin_root_path
	end
end