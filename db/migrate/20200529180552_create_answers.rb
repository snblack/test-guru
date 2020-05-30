class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, :null => false
      t.boolean :correct, default: TRUE
      t.integer :question_id

      t.index :question_id
      t.foreign_key(:questions, column: :question_id, primary_key: "id")

      t.timestamps
    end
  end
end
