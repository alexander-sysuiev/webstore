class Admin::BoilersController < Admin::BaseController
	def new
		@boiler = Boiler.new
	end

	def create
		picture = Picture.create params[:boiler].delete(:picture)
		boiler = Boiler.create params[:boiler].merge(:picture => picture)
		redirect_to category_boiler_path(:category_id => boiler.category_id, :id => boiler.id)
	end
end