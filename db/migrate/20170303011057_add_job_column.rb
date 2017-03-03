class AddJobColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :job_id, :integer
  end
end
