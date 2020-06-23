class AddEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, null: false
    add_index :users, :email, name: "index_email", unique: true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name, true
  end
end
