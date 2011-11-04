class Order < ActiveRecord::Base
	has_many :boiler_orders
	has_many :service_orders
	has_many :boilers, :through => :boiler_orders
	has_many :services, :through => :service_orders
	belongs_to :address_id

	after_create :generate_serial

private
	
	def generate_serial
		serial = "#{created_at.to_i.to_s[0..4]}-#{created_at.to_i.to_s[5..9]}#{self.id.to_s}"
		self.update_attributes! :order_number => serial
	end
end