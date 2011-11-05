class OrdersController < WorkflowController
	def new
		@order = Order.new
	end

	def create
		order = Order.create params[:order]

		session[:goods].each do |type|

			type[1].each do |product|
				good = type[0].camelize.constantize.find(product[0])
				joining_class = (type[0].camelize + 'Order').constantize
				quantity = product[1].to_i
				joining_class.create(:good_id => good.id, :price => good.price, :quantity => quantity, :type => type[0].to_s, :order_id => order.id)
			end
		end

		session[:goods] = nil

		redirect_to root_path
	end
end