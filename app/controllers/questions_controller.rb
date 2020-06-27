class QuestionsController < ApplicationController
  # /tests/:test_id/questions(.:format)
  before_action :authenticate_user!
  before_action :find_test, only: %i[index]

  def index
    @questions = @test.questions
  end
  # /questions/:id(.:format)
  def show
    find_question
  end

  private

  def find_test
    @test = Test.find(params['test_id'])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def find_question
    @question = Question.find(params['id'])
  end
end
