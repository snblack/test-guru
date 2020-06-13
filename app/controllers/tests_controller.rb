class TestsController < ApplicationController

  # /tests
  def index
    @tests = Test.all
  end

  # /tests/:id
  def show
    @test = Test.find(params['id'])
    @questions = @test.questions
  end

end
