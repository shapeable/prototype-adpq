class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("SENDER_EMAIL") { "hello@californiaalert.ca" }
  layout 'mailer'
  
  def send_mail(email, message, subject)
    @email = email
    @message = message
    mail to: @email, subject: subject
  end
end
