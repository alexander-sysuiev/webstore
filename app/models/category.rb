class Category < ActiveRecord::Base
	has_many :boilers
	has_many :services
	has_many :settings

	scope :boilers, :conditions => { :kind => :boiler }
	scope :services, :conditions => { :kind => :service }

	KINDS = [:service, :boiler]	

	def service?
		kind == 'service'
	end

end