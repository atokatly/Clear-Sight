class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :company, null: false
      t.string :company_field, null: false
      t.string :phone_bus, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
