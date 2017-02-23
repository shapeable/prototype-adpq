#rake send:sms_message
#rake send:mail_message
require_relative '../../app/modules/notification_center_module'
include NotificationCenterModule

namespace :send do
  task :sms_message => :environment do
    puts "Sending SMS"
    begin
      NotificationCenterModule.send_sms_message('+525530265963','Hello World')
    rescue Exception => ex
        puts ex.message
    end    
  end

  task :mail_message => :environment do
    begin
       NotificationCenterModule.send_mail_message('test@mail.com', 'Hello World', 'Test')
    rescue Exception => ex
        puts ex.message
    end
  end
end
