class SendMailJob < ApplicationJob
  queue_as :default

  def perform(gmail)
  	UserMailer.forgot_password(gmail).deliver_now
  end

end
