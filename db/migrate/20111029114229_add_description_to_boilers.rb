class AddDescriptionToBoilers < ActiveRecord::Migration
  def self.up
  	add_column :boilers, :description, :text
  end

  def self.down
  	remove_column :boilers, :description
  end
end
