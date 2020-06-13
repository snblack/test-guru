module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create New #{@test.title} Question"
    else
      "Edit #{Test.find(question.test_id).title}"
    end
  end
end
