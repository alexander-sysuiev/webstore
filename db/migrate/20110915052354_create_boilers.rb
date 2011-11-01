class CreateBoilers < ActiveRecord::Migration
  def self.up
    create_table :boilers do |t|
      t.string :name, :null => false
      t.decimal :price, :precision => 10, :scale => 2, :null => false
      t.integer :category_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :boilers
  end
end
