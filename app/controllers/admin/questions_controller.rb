class Admin::QuestionsController < Admin::BaseController
  # /tests/:test_id/questions(.:format)
  before_action :authenticate_user!
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[edit update show destroy]

  def index
    @questions = @test.questions
  end
  # /questions/:id(.:format)
  def show

  end

  def new
    @question = @test.questions.new
  end

  def edit

  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to admin_question_path(question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @test_id = @question.test_id
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def question_params
    params.permit(:body)
  end

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
