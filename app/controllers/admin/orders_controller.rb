class Admin::OrdersController < Admin::BaseController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find params[:id]
		@boilers = @order.boiler_orders
		@services = @order.service_orders
	end

	def update
		order = Order.find(params[:id])
		order.update_attributes params[:order]
		redirect_to admin_order_path
	end
end