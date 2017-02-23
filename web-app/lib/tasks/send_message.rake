#rake send:sms_message
#rake send:mail_message
require_relative '../../app/modules/notification_center'
include NotificationCenter

namespace :send do
  task :sms_message => :environment do
    puts "Sending SMS"
    begin
      NotificationCenter.send_sms_message('+525530265963','Hello World')
    rescue Exception => ex
        puts ex.message
    end    
  end

  task :mail_message => :environment do
    begin
       NotificationCenter.send_mail_message('test@mail.com', 'Hello World', 'Test')
    rescue Exception => ex
        puts ex.message
    end
  end
end
