class ChangeTests < ActiveRecord::Migration[6.0]
  def change
    remove_column(:tests, :user, :references, foreign_key: true)
    add_column(:tests, :category, :references, foreign_key: true)
  end
end
