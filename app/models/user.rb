class User < ApplicationRecord
  has_many :tests, through: :tests_users
  has_many :tests_created_author, class_name: "Test"
  has_many :tests_users

  validates :first_name, presence: true
  validates :last_name, presence: true

  scope :with_level, -> (level) {
    joins('JOIN reports ON reports.test_id = tests.id').
    where("users.id = :user AND tests.level = :level", level: level, user: self.id)
  }

  def tests_with_level(level)
    Test.with_level(level)
  end

end
