class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    if @test_passage.test.questions.count == 0
      redirect_to root_path, notice: ("У теста нет вопросов. Выберите другой.")
    end
  end

  def result

    if @test_passage.success?
      result = BadgeService.new(@test_passage)
      result.check_badge
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    gis = result.call
    if result.success?
      flash_options = { notice: t('.success', url: gis.html_url) }
      gist = @test_passage.user.gists.create(question: @test_passage.current_question, url: gis.html_url)
    else
      { alert: t('.failure') }
    end


    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.timeout?
      redirect_to root_path, notice: ("Ошибка таймера")
    elsif @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
