class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string		:first_name
      t.string		:last_name
      t.string		:email
      t.boolean	:admin
      t.database_authenticatable :null => false
      #t.confirmable
      t.rememberable  
      t.trackable
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :admins
  end
end
