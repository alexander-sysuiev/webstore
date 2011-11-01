class CreateGoodsOrders < ActiveRecord::Migration
  def self.up
  	create_table :goods_orders do |t|
  		t.integer :order_id, :null => false
  		t.integer :good_id, :null => false
  		t.string :type, :null => false
      t.timestamps
  	end
  end

  def self.down
  	drop_table :goods_orders
  end
end
