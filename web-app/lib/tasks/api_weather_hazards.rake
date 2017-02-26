#rake get:temperature
#rake get:weather
#rake get:wildfire
#rake get:current_warning
#rake get:watches_warning
require_relative '../../app/modules/geographic_manager'
require_relative '../../app/modules/notification_center'
include GeographicManager
include NotificationCenter

namespace :get do
  task :temperature => :environment do
    begin
        current_temperature=[]
        url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_temperature << info['label']
        end
        current_temperature.each do |temperature|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1/query?where=&text=#{temperature.to_param}+&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{temperature}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                          else
                            puts "#{temperature} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{temperature} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end

namespace :get do
  task :weather => :environment do
    begin
        current_weather=[]
        url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_weather << info['label']
        end
        current_weather.each do |weather|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4/query?where=&text=#{weather.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{weather}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                          else
                            puts "#{weather} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{weather} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end

namespace :get do
  task :wildfire => :environment do
    begin
        current_wildfire=[]
        url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/7?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_wildfire << info['label']
        end
        current_wildfire.each do |wildfire|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/7/query?where=&text=#{wildfire.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{wildfire}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                          else
                            puts "#{wildfire} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{wildfire} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end

namespace :get do
  task :current_warning => :environment do
    begin
        current_warnings=[]
        url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/0?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_warnings << info['label']
        end
        current_warnings.each do |warnings|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/0/query?where=&text=#{warnings.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{warnings}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                           else
                            puts "#{warnings} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{warnings} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end

namespace :get do
  task :watches_warning => :environment do
    begin
        watches_warnings=[]
        url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          watches_warnings << info['label']
        end
        watches_warnings.each do |warnings|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1/query?where=&text=#{warnings.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{warnings}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                           else
                            puts "#{warnings} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{warnings} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end
