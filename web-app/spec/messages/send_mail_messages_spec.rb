require 'rails/all'
require_relative '../../app/modules/notification_center_module'
require_relative '../../app/mailers/application_mailer'

module NotificationCenterModule
  class TestMail
      def deliver
      end
  end

  context "Message module" do
    it "send mail message" do
      mail = "test@mail.com"
      message = "Hello World"
      subject = "Test"
      client = TestMail.new
      mailer = allow(NotificationCenterModule).to receive(:create_mail).with(hash_including(mail: mail, message: message, subject: subject)) { client }
      allow(NotificationCenterModule).to receive(:deliver) {true}
      NotificationCenterModule.send_mail_message(mail, message, subject)
    end
  end
end
