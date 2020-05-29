class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end

    add_index :answers, :question_id
    add_foreign_key :answers, :questions

    change_column_null(:answers, :body, false)
    change_column_default(:answers, :correct, from: nil, to: TRUE)
  end
end
