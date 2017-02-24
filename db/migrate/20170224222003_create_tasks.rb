class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.integer :user_id, null: false
      t.integer :job_id, null: false 
      t.timestamps
    end
  end
end
