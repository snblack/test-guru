class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)

    if feedback.save
      redirect_to root_path, notice: ("Успешно создан")
      FeedbackMailer.sended_feedback.deliver_now
    else
      redirect_to new_feedback_path, notice: ("#{feedback.errors.full_messages }")
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
