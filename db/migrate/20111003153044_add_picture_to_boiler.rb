class AddPictureToBoiler < ActiveRecord::Migration
  def self.up
  	add_column :boilers, :picture_id, :integer
  end

  def self.down
  	remove_column :boilers, :picture_id
  end
end
