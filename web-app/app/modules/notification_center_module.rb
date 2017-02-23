module NotificationCenterModule
    
    def self.send_mail_message(mail, message, subject)
        @mailer = create_mail({:mail => mail, :message => message, :subject => subject})
        @mailer.deliver
    end 

    def self.send_sms_message(number, message)
        require 'twilio-ruby'
        @client = twilio_connection
        @message = @client.create({:from => sender_phone_number, :to => number, :body => message})
    end 

    def self.sender_phone_number=(number)
        @@from = number
    end

    private 

    def create_mail(values)
        ApplicationMailer.send_mail(values[:mail], values[:message], values[:subject])
    end

    def twilio_connection
        Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).account.sms.messages
    end

    def self.sender_phone_number
        @@from ||= ENV['SENDER_PHONE_NUMBER']
    end
end
