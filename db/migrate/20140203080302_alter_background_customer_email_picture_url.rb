class AlterBackgroundCustomerEmailPictureUrl < ActiveRecord::Migration
  def change
    if column_exists? :backend_customers, :email
      remove_column :backend_customers, :email
    end
    add_column :backend_customers, :picture_url, :string
    add_column :backend_customers, :user_id, :integer ,:null => false
    add_foreign_key :backend_customers, :users
  end
end
