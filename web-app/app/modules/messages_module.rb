module MessagesModule
    
    def send_SMS_message(number,message)
        
        require 'twilio-ruby'
    
        @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
        @message = @client.account.sms.messages.create({:from => ENV['NUMBER_CEL_FROM'], :to => number, :body => message})
        puts @message
    end 
end