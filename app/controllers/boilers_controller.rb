class BoilersController < ApplicationController
  def index
  	@category = Category.find_by_id(params[:category_id])
    @boilers = @category.nil? ? Boiler.all : @category.boilers
  end

  def show
  	@boiler = Boiler.find params[:id]
  	@settings = Setting.for_boiler(@boiler)
  end
end
