require 'spec_helper'

describe Admin::BoilersController do
	before do
		@admin = Factory :admin
		@boiler = Factory.build :boiler, :picture => nil
		@picture = Factory.build :picture
		@boiler.picture = @picture
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
		it "should not raise an exception on empty params" do
			expect do
				post :create
			end.to_not raise_exception
		end
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
			response.should render_template(:new)
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

	context "#update" do
		before do
			picture = Factory :picture
			@created_boiler = Factory :boiler, :picture => picture
		end

		it "should redirect to updated boiler" do
			put :update, :id => @created_boiler.id, :boiler => @boiler.attributes
			@created_boiler.reload
			response.should redirect_to(category_boiler_path(@created_boiler.category_id, @created_boiler.id))
		end

		it "should update params" do
			put :update, :id => @created_boiler.id, :boiler => @boiler.attributes
			(@boiler.attributes.to_a - @created_boiler.attributes.to_a).should_not be_empty 
			(@boiler.attributes.to_a - @created_boiler.reload.attributes.to_a).should be_empty 
		end

		it "should not change boilers quantity" do
			expect do
				put :update, :id => @created_boiler.id, :boiler => @boiler.attributes
			end.to_not change(Boiler, :count)
		end

		it "should render edit page on failure" do
			put :update, :id => @created_boiler.id, :boiler => @boiler.attributes.merge(:name => nil)
			response.should render_template(:edit)
		end
	end
end