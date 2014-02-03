class CreateBackendDesigns < ActiveRecord::Migration
  def change
    create_table :backend_designs do |t|
      t.string :name

      t.timestamps
    end
  end
end
