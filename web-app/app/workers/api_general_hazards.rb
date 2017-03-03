#ApiGeneralHazards.perform_async
class ApiGeneralHazards
  include Sidekiq::Worker

  def perform(alert_id, message)
    begin
        UserAlarm.all.each do |user_alert|
            if user_alert.alarm_id.to_s == alert_id.to_s
                user = User.find(user_alert.user_id)
                if user.email_actived
                    NotificationCenter.send_mail_message(user.email, message, 'California Alert')
                end
                if user.sms_actived
                    NotificationCenter.send_sms_message(user.phone_number, message)
                end
            end
        end
        puts "notification sent"
    rescue Exception => ex
        puts ex.message
    end    
  end
end