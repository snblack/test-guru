class AddAllNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :body, false)
    change_column_null(:answers, :body, false)
    change_column_null(:users, :first_name, false)
    change_column_null(:categories, :title, false)
  end
end
