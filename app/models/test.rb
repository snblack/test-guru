class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: tests_users


  def self.test_with_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id').
         where("categories.title = :category", category: category).
         order('tests.title DESC')
  end
end
