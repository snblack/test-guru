class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :questions, dependent: :delete_all

  # has_many :tests_users
  # has_many :users, through: :tests_users
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages


  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
    message: "should be unique with this level" }
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 10}

  scope :easy, -> {where(level: 0..1)}
  scope :middle, -> {where(level: 2..4)}
  scope :heavy, -> {where(level: 5..Float::INFINITY)}

  scope :join_categories, -> {
    joins('JOIN categories ON categories.id = tests.category_id')
  }

   def self.of_category(category)
     Test.join_categories.
          where("categories.title = :category", category: category).
          order('tests.title DESC').pluck(:title)
    end
end
