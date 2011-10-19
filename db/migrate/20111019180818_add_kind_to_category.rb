class AddKindToCategory < ActiveRecord::Migration
  def self.up
  	add_column :categories, :kind, :string
  end

  def self.down
  	remove_column :categories, :kind
  end
end
