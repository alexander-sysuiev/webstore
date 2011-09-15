class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.string :name
      t.string :price
      t.integer :category_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :goods
  end
end
