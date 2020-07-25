class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_num_question, on: :create
  before_update :before_update_set_next_question

  SUCCESS_LEVEL = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.num_question += 1

    save!
  end

  def result
    result = self.correct_questions.to_f / test.questions.count.to_f
    (result * 100).to_i
  end

  def success?
    self.result >= SUCCESS_LEVEL
  end

  def progress
    ((self.num_question.to_f - 1) / self.test.questions.count.to_f) * 100
  end

  def check_badge
    need_badge_all_test_category?
    need_badge_all_test_level?
    need_badge_test_first_attempt?
  end


  private

  def need_badge_all_test_category?
    test_prog = 0

    self.user.test_passages.map do |test_passage|
      if test_passage.test.category.title  == "Программирование" && test_passage.success?
        test_prog += 1
      end
    end

    if test_prog == Test.all.where(category_id: Category.find_by(title: 'Программирование').id).count
      self.user.get_badge("Прошел все тесты по прогроммированию")
    end
  end

  def need_badge_all_test_level?
    test_level = 0

    self.user.test_passages.map do |test_passage|
      if test_passage.test.level  == self.test.level && test_passage.success?
        test_level += 1
      end
    end

    if test_level == Test.all.where(level: self.test.level).count
      self.user.get_badge("Прошел все тесты уровня")
    end
  end

  def need_badge_test_first_attempt?
    test_attempt = 0
    self.user.test_passages.map do |test_passage|
      if test_passage.test_id  == self.test_id
        test_attempt += 1
      end
    end

    if test_attempt == 1
      self.user.get_badge("Прошел тест с первой попытки")
    end
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_num_question
    self.num_question = 1
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count ||= []
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
