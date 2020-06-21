class User < ApplicationRecord
  # has_many :tests_users
  # has_many :tests, through: :tests_users
  has_many :tests_created_author, class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages



  validates :first_name, presence: true
  validates :last_name, presence: true

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
