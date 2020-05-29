class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :user_id



      t.timestamps
    end

    add_index :tests, :user_id
    add_foreign_key :tests, :users
    
    change_column_null(:tests, :title, false)
    change_column_default(:tests, :level, from: nil, to: 1)

  end
end
