class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: tests_users

  def tests_with_level(level)
    Test.joins('JOIN reports ON reports.test_id = tests.id').
         joins('JOIN users ON users.id = reports.user_id').
        where("users.id = :user AND tests.level = :level", level: level, user: self.id)
  end
end
