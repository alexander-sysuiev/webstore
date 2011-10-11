class Category < ActiveRecord::Base
	has_many :boilers
	has_many :services
	has_many :settings
end