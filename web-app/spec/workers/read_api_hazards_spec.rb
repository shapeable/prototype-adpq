require 'rails/all'
require 'sidekiq/testing'
require_relative '../../app/workers/api_weather_hazards'
Sidekiq::Testing.fake!

module TestApiWeatherHazards
  context "Hazard module" do
    let(:worker) {ApiWeatherHazards.new}
    let(:value_test) {"Much Below Normal Temperatures"}
    let(:current_value){current_value=[]}
    let(:url) {"https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/4?f=pjson"}
    let(:url_features) {"https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer/1/query?where=&text=#{value_test.to_param}+&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=start_date%2C+end_date&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&f=pjson"}
    let(:json_response) {'{
      "drawingInfo": {
        "renderer": {
          "uniqueValueInfos": [
            {
              "symbol": {},
              "value": "High Winds",
              "label": "High Winds",
              "description": ""
            },
            {
              "symbol": {},
              "value": "Much Above Normal Temperatures",
              "label": "Much Above Normal Temperatures",
              "description": ""
            },
            {
              "symbol": {},
              "value": "Much Below Normal Temperatures",
              "label": "Much Below Normal Temperatures",
              "description": ""
            },
            {
              "symbol": {},
              "value": "Significant Waves",
              "label": "Significant Waves",
              "description": ""
            },
            {
              "symbol": {},
              "value": "Enhanced Wildfire Risk",
              "label": "Enhanced Wildfire Risk",
              "description": ""
            }
          ]
        },
        "transparency": 0,
        "labelingInfo": []
      }
    }'}

    let(:json_features_response){'{
      "features": [
        {
          "attributes": {
            "start_date": 1488412800000,
            "end_date": 1488758400000
          },
          "geometry": {
            "rings": [
              [
                [
                  -140.9989123280414,
                  61.894541385476657
                ],
                [
                  -140.99738532777064,
                  60.306829383369461
                ],
                [
                  -140.99715632800201,
                  60.306791383415657
                ],
                [
                  -140.52319032717179,
                  60.221865383580621
                ],
                [
                  -140.45263832739681,
                  60.309367383498056
                ]
              ]
            ]
          }
        }
      ]
    }'}
    
    it "read apis hazards" do
      allow(worker).to receive(:get_json_from_url).with(url) {json_response}
      allow(worker).to receive(:get_hazard_keys).with(json_response) {current_value}
      allow(worker).to receive(:get_json_from_type).with(url_features, "weather") {json_features_response}
      allow(worker).to receive(:parse_json_value).with(json_features_response, value_test, "weather") {true}
      worker.perform(url, "weather")
    end
  end
end
