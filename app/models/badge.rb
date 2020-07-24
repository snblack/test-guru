class Badge < ApplicationRecord
  has_many :badge_owners
  has_many :users, through: :badge_owners
  belongs_to :rule
end
