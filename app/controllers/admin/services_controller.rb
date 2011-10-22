class Admin::ServicesController < Admin::BaseController

	def new
	end

	def create
		picture = Picture.create params[:service].delete(:picture)
		service = Service.create params[:service].merge(:picture => picture)
		redirect_to category_service_path(:category_id => service.category_id, :id => service.id)
	end
end