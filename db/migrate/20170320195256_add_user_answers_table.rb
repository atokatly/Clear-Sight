class AddUserAnswersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :answers, :answer, :text, null: false
    add_column :answers, :user_id, :integer, null: false 
  end
end
