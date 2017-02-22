#rake send:message
require_relative '../../app/modules/messages_module'
include MessagesModule
namespace :send do
  task :message => :environment do
    puts "Enviando SMS"
    begin
      send_SMS_message('+525530265963','Hello World')
    rescue Exception => ex
        puts ex.message
    end    
  end
end
