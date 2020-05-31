class User < ApplicationRecord
  def tests_with_level(level)
    @level = level
    Test.joins('JOIN reports ON reports.test_id = tests.id').
         joins('JOIN users ON users.id = reports.user_id').
        where("users.id = #{self.id} AND tests.level = :level", level: @level)
  end
end
