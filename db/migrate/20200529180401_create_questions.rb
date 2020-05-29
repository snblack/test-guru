class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :test_id

      t.timestamps
    end

    add_index :questions, :test_id
    add_foreign_key :questions, :tests

    change_column_null(:questions, :body, false)

  end
end
