class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.database_authenticatable :null => false
      #t.confirmable
      t.rememberable  
      t.trackable
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :users
  end
end
