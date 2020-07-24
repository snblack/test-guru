class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  validates_format_of :email, :with => /@/
  validates :email, presence: true, uniqueness: true

  has_many :gists
  has_many :tests_created_author, class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :badge_owners
  has_many :badges, through: :badge_owners

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.class == Admin
  end

  def get_badge(badge)
    self.badge_owners.create(badge_id: Badge.find_by(title: badge).id)
  end

end
