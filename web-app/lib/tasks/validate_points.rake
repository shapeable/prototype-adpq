#rake query:validate_point
require_relative '../../app/modules/geographic_manager'
include GeographicManager

namespace :query do
  task :validate_point => :environment do
    puts "Validating point"
    begin
      if GeographicManager.point_in_polygon('-119.417932399','36.778261')
        "You are in california"
      end
      if GeographicManager.point_in_polygon('-99.4179323','19.778261')
        "You are not in california"
      end
    rescue Exception => ex
        puts ex.message
    end    
  end
end
