class NotificationsController < ApplicationController
  def index
    require 'twilio-ruby'
    # Replace the strings with your values from Twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN'] 
    number_from = ENV['NUMBER_CEL_FROM']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    # Replace the numbers with the correct values
    @message = @client.account.sms.messages.create({:from => number_from, :to => '+525530265963', :body => 'Hello World'})
    # puts out the result object
    puts @message
  end

end