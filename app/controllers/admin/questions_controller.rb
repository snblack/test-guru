class Admin::QuestionsController < Admin::BaseController
  # /tests/:test_id/questions(.:format)
  before_action :authenticate_user!
  before_action :find_test, only: %i[index create]

  def index
    @questions = @test.questions
  end
  # /questions/:id(.:format)
  def show
    find_question
  end

  def new
    find_test
    @question = Question.new
  end

  def edit
    find_question
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def update
    find_question

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    find_question
    @test_id = @question.test_id
    @question.destroy
    redirect_to "/tests/#{@test_id}"
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

  def find_question
    @question = Question.find(params['id'])
  end
end
