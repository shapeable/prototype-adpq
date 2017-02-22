module MessagesModule
    
    def self.send_SMS_message(number, message)
        require 'twilio-ruby'
        @client = twilio_connection
        @message = @client.create({:from => sender_phone_number, :to => number, :body => message})
    end 

    def self.sender_phone_number=(number)
        @@from = number
    end

    private 
    def twilio_connection
        Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).account.sms.messages
    end

    def self.sender_phone_number
        @@from ||= ENV['SENDER_PHONE_NUMBER']
    end
end
