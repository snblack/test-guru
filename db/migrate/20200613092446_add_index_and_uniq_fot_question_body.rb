class AddIndexAndUniqFotQuestionBody < ActiveRecord::Migration[6.0]
  def change
    add_index :questions, :body, name: "index_body", unique: true
  end
end
