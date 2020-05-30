class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, :null => false
      t.integer :level, default: 1
      t.integer :user_id

      t.index :user_id
      t.foreign_key(:users, column: :user_id, primary_key: "id")

      t.timestamps


    end
  end
end
