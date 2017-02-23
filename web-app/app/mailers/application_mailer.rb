class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDER_EMAIL']
  layout 'mailer'
  
  def send_mail(email, message, subject)
    @email = email
    @message = message
    mail to: @email, subject: subject
  end
end
