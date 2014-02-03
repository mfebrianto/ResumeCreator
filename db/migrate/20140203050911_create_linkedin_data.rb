class CreateLinkedinData < ActiveRecord::Migration
  def self.up
    create_table :linkedin_data do |t|
      t.string :email, :null => false
      t.string :access_token, :null => false
      t.timestamps
    end
    add_index :linkedin_data, :email, :unique => true
  end

  def self.down
    drop_table :linkedin_data
  end
end