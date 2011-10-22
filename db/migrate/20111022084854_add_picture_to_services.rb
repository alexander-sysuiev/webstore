class AddPictureToServices < ActiveRecord::Migration
  def self.up
  	add_column :services, :picture_id, :integer
  end

  def self.down
  	remove_column :services, :picture_id
  end
end
