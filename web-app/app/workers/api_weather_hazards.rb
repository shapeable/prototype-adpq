#ApiWeatherHazards.perform_async
class ApiWeatherHazards
  include Sidekiq::Worker

  def perform(url_main, type)
    begin
        json = get_json_from_url(url_main)
        keys_hazards = get_hazard_keys(json) 
        keys_hazards.each do |value|
            json_value = get_json_from_type(value, type)
            parse_json_value(json_value, value, type)
        end
    rescue Exception => ex
        puts ex.message
    end    
  end

  private
  def get_json_from_url(url_main)
      JSON.load(open(url_main))
  end

  def get_json_from_type(value, type)
    if type == "weather"
        json = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1/query?"+
        "where=&text=#{value.to_param}+&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR="+
        "&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true"+
        "&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields="+
        "&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"
    elsif type == "general"
        json = "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12/query?"+
        "where=&text=#{value.to_param}&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR="+
        "&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&maxAllowableOffset="+
        "&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics="+
        "&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson&__ncforminfo=uCzgGetb_239kWlDp1W4D44sFk2Ba6HD9oRQDJQEIVDya_62Q9VVuSjXV1vraAswK2eAdHMhgX1gAYsHzsuGCY4XW8_BuQuFLuO8GtOYQEoSZj-Es5XEJ5qDBTEU2XWpeSZAiSljcJULyWLbNQ_HzKrgNQORKMR_XfUT0rllN2jNctJZGbWVCv5RZUC4_Hh62_E71PQMDGu0zaCDKbpanO4Kam4YXOd1lfUj09z5wZosmApYsFHhB0_DagBj4rlgpJ9XrxRSE0VuHfRv8C2gc7a29MHhBuhXq3es1lAo_VvCR8OzPBxMFJhsBKFab1osA3BoCRaIpeO4-ZwJIYXVBWUeV6two-tOeNsISaeY3yyXZ_jwRn80sITcR0mR968KMh8rBeDUDH_NjRk2pmqxCyfPrc6Zkv96SXgawT5NA5x6TfGHUqc0qkfutoZK5uiRxhXHjmJT7uDhuBWx7HK560z-PnyizJalaHvrvdKEvQCJJKtK5YMboEWPeRkpNHMQX0CbenIERyP-Ancw9subm_MHSlNe_8ZIvM40aJYpI4_bVeTDYRtoSQ%3D%3D"
    end
      JSON.load(open(json))
  end

  def get_hazard_keys(json)
    current_value=[]
      json['drawingInfo']['renderer']['uniqueValueInfos'].each do |info|
        current_value << info['label']
      end
    return current_value
  end

  def parse_json_value(json_value, value, type)
    if json_value['features'].count > 0
        json_value['features'].each do |feature|
            if type == "weather"
                end_date = feature['attributes']['end_date']
                start_date = feature['attributes']['start_date']
            end
            feature['geometry']['rings'].each do |ring|
                ring.each do |coordenate|
                    if  GeographicManager.point_in_polygon(coordenate[0], coordenate[1])
                        puts "*****California ALERT*****"  
                        puts "type: #{value}"
                        puts "start_date: #{Time.at(start_date/1000)}" unless start_date.nil?
                        puts "end_date: #{Time.at(end_date/1000)}" unless end_date.nil?
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
end