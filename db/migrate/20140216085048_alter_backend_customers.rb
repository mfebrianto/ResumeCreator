class AlterBackendCustomers < ActiveRecord::Migration
  def self.up
    change_table :backend_customers do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :backend_customers, :photo
  end
end
