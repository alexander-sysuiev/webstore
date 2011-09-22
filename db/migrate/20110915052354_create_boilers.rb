class CreateBoilers < ActiveRecord::Migration
  def self.up
    create_table :boilers do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :category_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :boilers
  end
end
