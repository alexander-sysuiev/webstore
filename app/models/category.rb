class Category < ActiveRecord::Base
	has_many :boilers
	has_many :services
	has_many :settings

	named_scope :boilers, :conditions => { :kind => :boiler }
	named_scope :services, :conditions => { :kind => :service }

	KINDS = [:service, :boiler]	

	def service?
		kind == 'service'
	end

end