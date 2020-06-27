class Admin::AnswersController < Admin::BaseController

  def new
    @question = Question.find(params['question_id'])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params['question_id'])
    answer = @question.answers.new(answer_params)
    if answer.save
      redirect_to admin_question_path(answer.question)
    else
      render :new
    end
  end

  def edit
    @answer = Answer.find(params['id'])
  end

  def update
    @answer = Answer.find(params['id'])

    if @answer.update(answer_params)
      redirect_to admin_question_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params['id'])
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  def answer_params
    params.permit(:body)
  end

end
