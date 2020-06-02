class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, foreign_key: true
  end
end
