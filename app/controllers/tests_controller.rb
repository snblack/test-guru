class TestsController < ApplicationController

  before_action :set_test, only: %i[show edit update destroy start]
  before_action :set_user, only: :start
  # /tests
  def index
    @tests = Test.all
  end

  # /tests/:id
  def show
    @questions = @test.questions
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def set_test
    @test = Test.find(params['id'])
  end

  def set_user
    @user = User.first
  end

end
