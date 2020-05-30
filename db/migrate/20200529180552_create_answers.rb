class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, :null => false
      t.boolean :correct, default: TRUE
      t.references(:question, index: true, foreign_key: true)

      t.timestamps
    end
  end
end
