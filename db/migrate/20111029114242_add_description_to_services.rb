class AddDescriptionToServices < ActiveRecord::Migration
  def self.up
  	add_column :services, :description, :text
  end

  def self.down
  	remove_column :services, :description
  end
end
