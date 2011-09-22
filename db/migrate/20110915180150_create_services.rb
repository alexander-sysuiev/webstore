class CreateServices < ActiveRecord::Migration
  def self.up
  	create_table :services do |t|
  		t.string :name
  		t.integer :category_id
  		t.integer :boiler_id
  		t.decimal :price
  	end
  end

  def self.down
  	drop_table :services
  end
end
