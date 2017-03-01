Alarm.delete_all
AlarmCategory.delete_all

category_1 = AlarmCategory.create(name: 'Real time alerts & Forecast', description: 'Get informed in advance and prevent risks concerning weather hazards, tsunamis, earthquakes and tornadoes.')
category_2 = AlarmCategory.create(name: 'Meeting Points & Collection Centers', description: 'Know about safe places for emergency and places for helping those in neeed.')
category_3 = AlarmCategory.create(name: 'Important Broadcast', description: 'Receive live instructions to evacuate or breaking news about a contingency.')

Alarm.create(name: "Flooding Occurring or Imminent", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Severe Weather", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Enhanced Wildfire Risk", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Tornado Warning", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/0?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Excessive Heat Warning", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "High Surf Warning", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Tsunami Warning", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Earthquake Warning", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Hurricane Warning", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Severe Thunderstorm Warning", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)


Alarm.create(name: "Meeting points", description: "meeting", end_point: "", alarm_category_id: category_2.id)
Alarm.create(name: "Risks", description: "risks", end_point: "", alarm_category_id: category_3.id)