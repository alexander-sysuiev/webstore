class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :picture
end