require 'spec_helper'

describe BoilersController do
	context "#index" do
		before do
			@category = Factory :category
		end
		it "should work" do
			get :index, :category => @category
			response.should be_success
		end
	end
end