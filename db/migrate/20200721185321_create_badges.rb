class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.references :rule, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
