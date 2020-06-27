module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Create New #{@question.body} Answer"
    else
      "Edit #{Question.find(answer.question_id).body}"
    end
  end
end
