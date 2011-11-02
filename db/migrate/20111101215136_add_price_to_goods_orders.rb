class AddPriceToGoodsOrders < ActiveRecord::Migration
  def self.up
  	add_column :goods_orders, :price, :decimal, :precision => 10, :scale => 2
  	add_column :goods_orders, :quantity, :integer
  end

  def self.down
  	remove_column :goods_orders, :price
  	remove_column :goods_orders, :quantity
  end
end
