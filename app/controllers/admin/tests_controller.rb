class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy start]

  # /tests
  def index
    @tests = Test.all
  end

  # /tests/:id
  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit

  end

  def create
    @test = current_user.tests.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_tests_path(@test)
    else
      render :new
    end
  end

  def update

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def set_test
    @test = Test.find(params['id'])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

end