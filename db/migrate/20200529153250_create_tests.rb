class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
