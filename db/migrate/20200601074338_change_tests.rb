class ChangeTests < ActiveRecord::Migration[6.0]
  def change
    remove_column(:tests, :user_id)
    add_reference :tests, :category, foreign_key: true
  end
end
