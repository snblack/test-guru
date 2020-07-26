class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  scope :find_tests_from_category, -> {
    joins('JOIN categories ON categories.id = tests.category_id').
    where("categories.title = :category", category: category)
  }

  def check_badge
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule.title}_award?", badge.rule.body)
    end
  end

  def all_test_from_programm_award?(category)
    user_tests = @test_passage.user.tests.find_tests_from_category

    all_tests_from_programm = Test.all.find_tests_from_category

    user_tests == all_tests_from_programm
  end


  def all_test_level_first_award?(level)
    user_tests = @test_passage.user.tests.where(level: level)
    all_tests_from_level = Test.all.where(level: level)

    user_tests == all_tests_from_level
  end

  def first_attempt_award?(attempt)
    user_tests = @test_passage.user.tests.where(id: @test_passage.test.id)
    user_tests == attempt
  end

end
