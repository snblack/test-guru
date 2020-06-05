class TestsUser < ApplicationRecord
  belongs_to :users
  belongs_to :tests
end
