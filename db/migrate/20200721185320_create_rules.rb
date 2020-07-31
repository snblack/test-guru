class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
