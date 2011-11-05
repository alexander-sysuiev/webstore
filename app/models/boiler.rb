class Boiler < ActiveRecord::Base
	belongs_to :picture
	has_many :settings

	PER_PAGE = 4
end
