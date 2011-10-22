class CreateSettingNames < ActiveRecord::Migration
  def self.up
  	create_table :setting_names do |t|
		t.string :name, :null => false
		t.timestamps  		
  	end
  end

  def self.down
  	drop_table :setting_names
  end
end
