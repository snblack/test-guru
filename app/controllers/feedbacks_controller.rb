class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)

    if feedback.save!
      redirect_to root_path, notice: t("Успешно создан")
      FeedbackMailer.sended_feedback.deliver_now
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end

end
