class AddValidateForTests < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, [:title, :level], name: "index_title_and_level", unique: true
  end
end
