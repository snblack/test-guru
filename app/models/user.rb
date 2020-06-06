class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests_created_author, class_name: "Test"


  validates :first_name, presence: true
  validates :last_name, presence: true

  def tests_with_level(level)
    tests.where(level: level)
  end
end
