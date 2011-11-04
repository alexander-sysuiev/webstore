class AddFieldsToOrder < ActiveRecord::Migration
  def self.up
  	add_column :orders, :name, :string, :null => false
  	add_column :orders, :order_number, :string
  	add_column :orders, :proceed, :boolean
  end

  def self.down
  	remove_column :orders, :proceed
  	remove_column :orders, :order_number
  	remove_column :orders, :name
  end
end
