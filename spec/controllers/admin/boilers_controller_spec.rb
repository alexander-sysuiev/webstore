require 'spec_helper'

describe Admin::BoilersController do
	before do
		@admin = Factory :admin
		@boiler = Factory.build :boiler, :picture => nil
		@picture = Factory.build :picture
		sign_in @admin
	end

	it "should work with new" do
		get :new
		response.should be_success
	end

	it "should work with edit" do
		@boiler.save!
		get :edit, :id => @boiler.id
		response.should be_success
	end

	context "#create" do
		it "should redirect to created boiler" do
			post :create, :boiler => @boiler.attributes
			Boiler.count.should == 1
			boiler = Boiler.first
			response.should redirect_to(category_boiler_path(:category_id => boiler.category_id, :id => boiler.id))
		end

		it "should render new page if no params" do
			post :create
			response.should redirect_to(new_admin_boiler_path)
		end

		it "should render new page on failure" do
			post :create, :boiler => {:name => 'aaa', :category => @boiler.category}
			response.should render_template(new_admin_boiler_path)
		end

		it "should create boiler" do
			expect do
				post :create, :boiler => @boiler.attributes
			end.to change(Boiler, :count).from(0).to(1)
		end

		it "should create picture" do
			expect do
				post :create, :boiler => @boiler.attributes.merge(:picture => @picture.attributes)
			end.to change(Picture, :count).from(0).to(1)
		end

		it "should relate picture to boiler" do
			post :create, :boiler => @boiler.attributes.merge(:picture => @picture.attributes)
			picture = Picture.first
			boiler = Boiler.first
			boiler.picture.should == picture
		end
	end
end