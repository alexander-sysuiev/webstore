class Admin::BoilersController < Admin::BaseController
	def new
		@boiler = Boiler.new
	end

	def create
		picture = Picture.create params[:boiler].delete(:picture)
		boiler = Boiler.create params[:boiler].merge(:picture => picture)
		redirect_to category_boiler_path(:category_id => boiler.category_id, :id => boiler.id)
	end

	def edit
		@boiler = Boiler.find(params[:id])
	end

	def update
		boiler = Boiler.find params[:id]
		picture = Picture.create params[:boiler].delete(:picture) if params[:boiler][:picture].present?
		attrs = picture.nil? ? params[:boiler] : params[:boiler].merge(:picture => picture)
		
		boiler.update_attributes attrs

		redirect_to category_boiler_path(boiler.category_id, boiler.id)
	end
end