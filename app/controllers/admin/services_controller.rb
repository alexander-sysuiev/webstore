class Admin::ServicesController < Admin::BaseController

	def new
		@service = Service.new
	end

	def edit
		@service = Service.find params[:id]
	end

	def create
		picture = Picture.create params[:service].delete(:picture)
		service = Service.create params[:service].merge(:picture => picture)
		redirect_to category_service_path(:category_id => service.category_id, :id => service.id)
	end

	def update
		service = Service.find params[:id]
		picture = Picture.create params[:service].delete(:picture) if params[:service][:picture].present?
		attrs = picture.nil? ? params[:service] : params[:service].merge(:picture => picture)
		
		service.update_attributes attrs

		redirect_to category_service_path(service.category_id, service.id)
	end
end