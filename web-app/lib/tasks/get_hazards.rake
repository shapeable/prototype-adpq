#rake get:hazards
namespace :get do
  task :hazards => :environment do
    begin
        ApiWeatherHazards.perform_async("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson", "weather")
        ApiWeatherHazards.perform_async("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1?f=pjson", "weather")
        ApiWeatherHazards.perform_async("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/7?f=pjson", "weather")
        ApiWeatherHazards.perform_async("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/0?f=pjson", "weather")
        ApiWeatherHazards.perform_async("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", "weather")        
        ApiWeatherHazards.perform_async("https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", "general")
    rescue Exception => ex
        puts ex.message
     end
  end
end
