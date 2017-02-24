class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :address, null: false
      t.string :description, null: false
      t.string :company_field, null: false 
      t.timestamps
    end
  end
end
