module MessagesModule
    
    def self.send_SMS_message(number,message)
        
        require 'twilio-ruby'
        @client = twilio_connection
        @message = @client.create({:from => number_cel_from, :to => number, :body => message})
    end 

    def self.number_cel_from=(number)
        @@from = number
    end

    private 
    def twilio_connection
        Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).account.sms.messages
    end

    def self.number_cel_from
        @@from ||= ENV['NUMBER_CEL_FROM']
    end
end