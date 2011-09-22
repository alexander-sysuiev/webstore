class ServicesController < ApplicationController
	def index
		@category = Category.find_by_id params[:category_id]
		@services = @category.nil? ? Service.all : @category.services
	end
end