class QuestionsController < ApplicationController
  # /tests/:test_id/questions(.:format)

  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end
  # /questions/:id(.:format)
  def show
    @question = Question.find(params['id'])
  end

  def new
  end

  def create
    question = @test.questions.create(question_params)
    render plain: question.inspect
  end

  # /questions/:id
  def destroy
    @question = Question.find(params['id'])
    @question.destroy
    redirect_to "/tests/#{@test.id}/questions/"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params['test_id'])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
