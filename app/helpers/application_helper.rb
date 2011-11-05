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
		number_to_currency price, :unit => "uah", :format => "%n %u"
	end
end