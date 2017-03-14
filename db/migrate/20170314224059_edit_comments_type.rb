class EditCommentsType < ActiveRecord::Migration[5.0]
  def change
    change_column :comments, :comment, :text
  end
end
