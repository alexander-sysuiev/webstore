class Boiler < ActiveRecord::Base
	belongs_to :picture
	has_many :settings
end
