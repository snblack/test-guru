class ChangeTestPassages < ActiveRecord::Migration[6.0]
  def change
    drop_table :test_passages, if_exists: true

    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      # t.references :question, null: false, foreign_key: true
      t.integer :correct_questions, default:0
      t.integer :num_question

      t.timestamps
    end
  end
end
