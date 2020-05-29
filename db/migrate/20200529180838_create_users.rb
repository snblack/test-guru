class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    change_column_null(:users, :first_name, false)
    
  end
end
