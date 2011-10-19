class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name 
end
