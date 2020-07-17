class FeedbackMailer < ApplicationMailer
  def sended_feedback
    @feedback = Feedback.last
    mail(to: 'snblack06@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
