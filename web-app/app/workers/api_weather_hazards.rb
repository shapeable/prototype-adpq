#ApiWeatherHazards.perform_async
class ApiWeatherHazards
  include GeographicManager
  include NotificationCenter
  include Sidekiq::Worker

  def perform(url_main)
    begin
        current_value=[]
        json = JSON.load(open(url_main))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_value << info['label']
        end
        current_value.each do |value|
            url = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1/query?where=&text=#{value.to_param}+&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{value}"
                             puts "start_date: #{Time.at(start_date/1000)}"
                             puts "end_date: #{Time.at(end_date/1000)}"
                          else
                            puts "#{value} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{value} has not values"
            end
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end