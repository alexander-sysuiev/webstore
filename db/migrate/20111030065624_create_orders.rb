class CreateOrders < ActiveRecord::Migration
  def self.up
  	create_table :orders do |t|
  		t.string :email
  		t.string :phone, :null => false
  		t.decimal :price, :precision => 10, :scale => 2, :null => false
  		t.integer :address_id
  		t.timestamps
  	end
  end

  def self.down
  	drop_table :orders
  end
end
