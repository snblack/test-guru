class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, :null => false
      t.integer :test_id

      t.index :test_id
      t.foreign_key(:tests, column: :test_id, primary_key: "id")

      t.timestamps
    end

  end
end
