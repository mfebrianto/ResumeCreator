class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :total, precision:4, scale:2
      t.string :currency

      t.timestamps
    end
  end
end
