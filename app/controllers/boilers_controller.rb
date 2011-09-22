class BoilersController < ApplicationController
  def index
  	@category = Category.find_by_id(params[:category_id])
    @boilers = @category.nil? ? Boiler.all : @category.boilers
  end
end
