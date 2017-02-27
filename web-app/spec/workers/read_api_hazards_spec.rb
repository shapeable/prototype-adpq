require 'rails/all'
require 'sidekiq/testing'
require_relative '../../app/workers/api_weather_hazards'
Sidekiq::Testing.fake!

module TestApiWeatherHazards
  context "Hazard module" do
    let(:worker) {ApiWeatherHazards.new}
    let(:value_test) {"Enhanced Wildfire Risk"}
    let(:current_value){current_value=[]}
    let(:url) {"https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson"}
    let(:url_features) {"https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1/query?where=&text=#{value_test.to_param}+&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"}
    let(:json_response) {'{
      "drawingInfo": {
        "renderer": {
          "uniqueValueInfos": [{
            "symbol": {
              "type": "esriSFS",
              "style": "esriSFSSolid",
              "color": [
                130,
                130,
                130,
                255
              ],
              "outline": {
                "type": "esriSLS",
                "style": "esriSLSSolid",
                "color": [
                  110,
                  110,
                  110,
                  255
                ],
                "width": 0.4
              }
            },
            "value": "Enhanced Wildfire Risk",
            "label": "Enhanced Wildfire Risk",
            "description": ""
          }, {
            "symbol": {
              "type": "esriSFS",
              "style": "esriSFSSolid",
              "color": [
                207,
                181,
                151,
                255
              ],
              "outline": {
                "type": "esriSLS",
                "style": "esriSLSSolid",
                "color": [
                  110,
                  110,
                  110,
                  255
                ],
                "width": 0.4
              }
            },
            "value": "Severe Drought",
            "label": "Severe Drought",
            "description": ""
          }]
        }
      }
    }'}

    let(:json_features_response){'{
        "features": [
          
        ]
      }'}
    
    it "read apis hazards" do
      allow(TestApiWeatherHazards).to receive(:get_json_from_url).with(url) {json_response}
      allow(TestApiWeatherHazards).to receive(:get_keys_hazards).with(json_response) {current_value}
      allow(TestApiWeatherHazards).to receive(:get_json_from_type).with(url_features, "weather") {json_features_response}
      allow(TestApiWeatherHazards).to receive(:parse_json_value).with(json_features_response, value_test, "weather") {true}
      worker.perform(url, "weather")
    end
  end
end
