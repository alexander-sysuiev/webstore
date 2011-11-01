class CreateServices < ActiveRecord::Migration
  def self.up
  	create_table :services do |t|
  		t.string :name, :null => false
  		t.integer :category_id, :null => false
  		t.integer :boiler_id
  		t.decimal :price, :null => false
  	end
  end

  def self.down
  	drop_table :services
  end
end
