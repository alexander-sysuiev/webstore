require 'spec_helper'

describe OrdersController do
	context "#new" do
		it "should work" do
			get :new
			response.should be_success
		end
	end
	context "#create" do
		before do
			@order = Factory.build :order
		end
		it "should render page on fail" do
			post :create
			assigns(:order).errors.should_not be_empty
			response.should be_success
			response.should render_template(new_order_path)
		end

		it "should not create an order on error" do
			expect do
				post :create
			end.to_not change(Order, :count)
		end

		it "should redirect to root" do
			post :create, :order => @order.attributes
			assigns(:order).errors.should be_empty
			response.should redirect_to(root_path)
		end

		it "should create order" do
			expect do
				post :create, :order => @order.attributes
			end.to change(Order, :count).from(0).to(1)
		end

		it "should create joining class" do
			boiler = Factory :boiler
			session[:goods] = {:boiler => {boiler.id => 3}}
			expect do
				post :create, :order => @order.attributes
			end.to change(BoilerOrder, :count).from(0).to(1)
		end
	end
end