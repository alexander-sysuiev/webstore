class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
    end
  end

  def self.down
    drop_table :admins
  end
end
