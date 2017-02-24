class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.integer :job_id, null: false 
      t.timestamps
    end
  end
end
