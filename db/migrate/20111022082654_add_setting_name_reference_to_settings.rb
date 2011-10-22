class AddSettingNameReferenceToSettings < ActiveRecord::Migration
  def self.up
  	add_column :settings, :setting_name_id, :integer, :null => false
  	remove_column :settings, :name
  end

  def self.down
  	add_column :settings, :name, :string
  	remove_column :settings, :setting_name_id
  end
end
