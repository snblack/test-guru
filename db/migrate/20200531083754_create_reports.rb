class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|

      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
