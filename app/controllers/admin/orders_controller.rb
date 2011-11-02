class Admin::OrdersController < Admin::BaseController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find params[:id]
		@boilers = @order.boiler_orders
	end
end