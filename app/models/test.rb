class Test < ApplicationRecord
  def self.test_with_category(category)
    @category = category
    Test.joins('JOIN categories ON categories.id = tests.category_id').
         where("categories.title = :category", category: @category).
         order('tests.title DESC')
  end
end
