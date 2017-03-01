#rake get:hazards
namespace :get do
  task :hazards => :environment do
    begin
      Alarm.where('description=? OR description=?', 'weather', 'general').each do |alarm|
          ApiWeatherHazards.perform_async(alarm.end_point, alarm.description, alarm.name)
      end
    rescue Exception => ex
        puts ex.message
     end
  end
end
