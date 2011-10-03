module ApplicationHelper
	def category_link(category)
		path = category.boilers.any? ? category_boilers_path(category) :
    															 category_services_path(category)
		link_to category.name, path, :class => "category"
	end
end
