class CreateBackendPositions < ActiveRecord::Migration
  def change
    create_table :backend_positions do |t|
      t.string :industry
      t.integer :backend_customer_id
      t.string :name
      t.string :size
      t.string :company_type
      t.date :start_date
      t.date :end_date
      t.text :summary
      t.string :title

      t.timestamps
    end

    add_foreign_key :backend_positions, :backend_customers

  end
end
