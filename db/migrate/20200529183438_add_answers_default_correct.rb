class AddAnswersDefaultCorrect < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, from: nil, to: TRUE)
  end
end
