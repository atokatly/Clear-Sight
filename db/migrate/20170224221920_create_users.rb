class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, :null => false, unique: true
      t.string :f_name, :null => false
      t.string :l_name, :null => false
      t.string :email, :null => false, unique: true
      t.string :password_digest, null: false
      t.string :title, :null => false
      t.string :phone, null: false
      t.integer :business_id, :null => false
      t.timestamps
    end
  end
end
