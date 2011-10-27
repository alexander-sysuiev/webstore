class Setting < ActiveRecord::Base
	belongs_to :boiler
	belongs_to :category
	belongs_to :setting_name
	delegate :name, :to => :setting_name

	named_scope :for_category, lambda{ |c| {:conditions => ['settings.category_id = ?', c.id]} }
	named_scope :for_boiler, lambda{ |boiler|
			{:conditions => ['settings.boiler_id = ? OR settings.category_id = ?', boiler.id, boiler.category_id]}
	}
end