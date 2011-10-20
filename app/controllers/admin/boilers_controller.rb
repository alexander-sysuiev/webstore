class Admin::BoilersController < Admin::BaseController
	def new
		@boiler = Boiler.new
	end
end