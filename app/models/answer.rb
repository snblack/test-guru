class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> {where(correct: true)}
  validates :body, presence: true
  validate :validate_quantity

  def validate_quantity
    if !(0..3).include?(self.question.answers.count)
      errors.add(:quantity, "question must be 1..4")
    end
  end
end
