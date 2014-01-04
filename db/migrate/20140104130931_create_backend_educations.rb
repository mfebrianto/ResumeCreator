class CreateBackendEducations < ActiveRecord::Migration
  def change
    create_table :backend_educations do |t|
      t.string :activities
      t.integer :backend_customer_id
      t.string :degree
      t.timestamp :end_date
      t.string :field_of_study
      t.string :notes
      t.string :school_name
      t.timestamp :start_date

      t.timestamps
    end

    add_foreign_key :backend_educations, :backend_customers

  end
end
