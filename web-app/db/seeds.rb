Alarm.delete_all
AlarmCategory.delete_all

category_1 = AlarmCategory.create(name: 'Real time alerts & Forecast',name_es: "Alertas en tiempo real y pronóstico", description: 'Get informed in advance and prevent risks concerning weather hazards, tsunamis, earthquakes and tornadoes.')
category_2 = AlarmCategory.create(name: 'Meeting Points & Collection Centers',name_es: "Puntos de reunion y centros de acopio", description: 'Know about safe places for emergency and places for helping those in need.')
category_3 = AlarmCategory.create(name: 'Important Broadcast',name_es: "Transmiciones importantes", description: 'Receive live instructions to evacuate or breaking news about a contingency.')

Alarm.create(name: "Flooding Occurring or Imminent",name_es: "Inundación inminente o en proceso", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Severe Weather",name_es: "Clima extremo", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Enhanced Wildfire Risk",name_es: "Riesgo de incendio", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Tornado Warning",name_es: "Advertencia de tornado", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/0?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Excessive Heat Warning",name_es: "Calor excesivo", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "High Surf Warning",name_es: "Advertencia de oleaje", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Tsunami Warning",name_es: "Advertencia de tsunami", description: "weather", end_point: "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Forecasts_Guidance_Warnings/watch_warn_adv/MapServer/1?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Earthquake Warning",name_es: "Advertencia de terremoto", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Hurricane Warning",name_es: "Advertencia de huracan", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)
Alarm.create(name: "Severe Thunderstorm Warning",name_es: "Advertencia de tormenta eléctrica", description: "general", end_point: "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer/12?f=pjson", alarm_category_id: category_1.id)


Alarm.create(name: "Meeting points",name_es: "Puntos de reunion", description: "meeting", end_point: "", alarm_category_id: category_2.id)
Alarm.create(name: "Risks",name_es: "Riesgo", description: "risks", end_point: "", alarm_category_id: category_3.id)
