class OrdersController < WorkflowController
	def new
		@order = Order.new
	end

	def create
		@order = Order.new params[:order]

		if @order.save
			@cart_session.types.each do |type|
				type.items do |product|
					joining_class.create(:good_id => product[:item].id,
										 :price => product[:item].price,
										 :quantity => product[:quantity],
										 :type => type.name,
										 :order_id => @order.id)
				end
			end
			session[:goods] = nil
			flash[:success] = 'Order is successfully created'
			redirect_to root_path
		else
			flash[:error] = 'Order is not valid'
			render new_order_path
		end
	end
end