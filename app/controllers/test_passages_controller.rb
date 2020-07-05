class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    gis = result.call
    flash_options = if result.success?
      { notice: t('.success', url: gis.html_url) }
    else
      { alert: t('.failure') }
    end

    gist = @test_passage.user.gists.new(question: @test_passage.current_question, url: gis.html_url)
    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answers_ids])

    if @test_passage.completed?
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
