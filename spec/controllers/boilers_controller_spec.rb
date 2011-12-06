require 'spec_helper'

describe BoilersController do
	context "#index" do
		before do
			@category = Factory :category
			@boiler = Factory :boiler, :category => @category
		end

		it "should successfuly do index" do
			get :index, :category => @category
			response.should be_success
		end

		it "should successfuly do show" do
			get :show, :id => @boiler.id, :category_id => @category.id
			response.should be_success
		end
	end
end