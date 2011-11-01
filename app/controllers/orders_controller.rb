class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		Order.create params[:order]
		session[:goods] = nil

		redirect_to root_path
	end
end