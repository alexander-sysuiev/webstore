# encoding: utf-8
module ApplicationHelper
	def category_link(category)
		path = category.boilers.any? ? category_boilers_path(category) :
    															 category_services_path(category)
		link_to category.name, path, :class => "category"
	end

	def product_link(product)
		path = send("category_#{product.class.to_s.downcase}_path", product.category_id, product.id)
		link_to product.name, path
	end

	def format_price(price)
		number_to_currency price, :unit => "грн.", :format => "%n %u"
	end

	def buy_button(model)
		 link_to 'Buy',
		 		 '#',
		 		 :class => 'buy-button',
		 		 "data-product-id" => model.id,
		 		 "data-product-type" => model.class.to_s.downcase
	end

	def quantity_button(action, model)
		class_action = action == '+' ? 'increase' : 'decrease'
		link_to action,
				'#',
				:class => "quantity-#{class_action}",
				"data-product-id" => model.id,
				"data-product-type" => model.class.to_s.downcase
	end
end