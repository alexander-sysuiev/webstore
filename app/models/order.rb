class Order < ActiveRecord::Base
	has_many :boiler_orders
	has_many :service_orders
	has_many :boilers, :through => :boiler_orders
	has_many :services, :through => :service_orders
	belongs_to :address_id
end