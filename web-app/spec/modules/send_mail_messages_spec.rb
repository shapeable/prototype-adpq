require 'rails/all'
require_relative '../../app/modules/notification_center'
require_relative '../../app/mailers/application_mailer'

module NotificationCenter
  class TestMail
    def deliver
    end
  end

  context "Message module" do
    
    let(:mail) {"test@mail.com"}
    let(:message) {"Hello World"}
    let(:subject) {"Test"}
    let(:client) {TestMail.new}

    it "send mail message" do
      mailer = allow(NotificationCenter).to receive(:create_mail).with(hash_including(mail: mail, message: message, subject: subject)) { client }
      allow(client).to receive(:deliver) {true}
      NotificationCenter.send_mail_message(mail, message, subject)
    end
  end
end
