category_1 = AlarmCategory.create(name: 'Real time alerts & Forecast', description: 'Get informed in advance and prevent risks concerning weather hazards, tsunamis, earthquakes and tornadoes.')
category_2 = AlarmCategory.create(name: 'Meeting Points & Collection Centers', description: 'Know about safe places for emergency and places for helping those in neeed.')
category_3 = AlarmCategory.create(name: 'Important Broadcast', description: 'Receive live instructions to evacuate or breaking news about a contingency.')

Alarm.create(name: "Contingency Planning: Where to donate", description: "", end_point: "", alarm_category_id: category_1.id)
Alarm.create(name: "Earthquakes", description: "", end_point: "", alarm_category_id: category_1.id)
Alarm.create(name: "Tornado", description: "", end_point: "", alarm_category_id: category_1.id)
Alarm.create(name: "Tsunami", description: "", end_point: "", alarm_category_id: category_1.id)

Alarm.create(name: "Meeting points", description: "", end_point: "", alarm_category_id: category_2.id)

Alarm.create(name: "Risks", description: "", end_point: "", alarm_category_id: category_3.id)
