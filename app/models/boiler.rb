class Boiler < ActiveRecord::Base
	belongs_to :picture
	has_many :settings
	belongs_to :category

	PER_PAGE = 4
end
