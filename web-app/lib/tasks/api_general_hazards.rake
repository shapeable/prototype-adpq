#rake get:warnings
require_relative '../../app/modules/geographic_manager'
require_relative '../../app/modules/notification_center'
include GeographicManager
include NotificationCenter

namespace :get do
  task :warnings => :environment do
    begin
        current_warning=[]
        url = "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson"
        json = JSON.load(open(url))
        json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
          current_warning << info['label']
        end
        current_warning.each do |warning|
            url = "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12/query?where=&text=#{warning.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson&__ncforminfo=uCzgGetb_239kWlDp1W4D44sFk2Ba6HD9oRQDJQEIVDya_62Q9VVuSjXV1vraAswK2eAdHMhgX1gAYsHzsuGCY4XW8_BuQuFLuO8GtOYQEoSZj-Es5XEJ5qDBTEU2XWpeSZAiSljcJULyWLbNQ_HzKrgNQORKMR_XfUT0rllN2jNctJZGbWVCv5RZUC4_Hh62_E71PQMDGu0zaCDKbpanO4Kam4YXOd1lfUj09z5wZosmApYsFHhB0_DagBj4rlgpJ9XrxRSE0VuHfRv8C2gc7a29MHhBuhXq3es1lAo_VvCR8OzPBxMFJhsBKFab1osA3BoCRaIpeO4-ZwJIYXVBWUeV6two-tOeNsISaeY3yyXZ_jwRn80sITcR0mR968KMh8rBeDUDH_NjRk2pmqxCyfPrc6Zkv96SXgawT5NA5x6TfGHUqc0qkfutoZK5uiRxhXHjmJT7uDhuBWx7HK560z-PnyizJalaHvrvdKEvQCJJKtK5YMboEWPeRkpNHMQX0CbenIERyP-Ancw9subm_MHSlNe_8ZIvM40aJYpI4_bVeTDYRtoSQ%3D%3D"
            json = JSON.load(open(url))
            if json['features'].count > 0
                json['features'].each do |feature|
                    end_date = feature['attributes']['end_date']
                    start_date = feature['attributes']['start_date']
                    feature['geometry']['rings'].each do |ring|
                        ring.each do |coordenate|
                          if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                             puts "*****California ALERT*****"  
                             puts "type: #{warning}"
                          else
                            puts "#{warning} has values but not in Cali"
                          end
                        end
                    end
                end
            else
                puts "#{warning} has not values"
            end
            
        end
    rescue Exception => ex
        puts ex.message
    end    
  end
end