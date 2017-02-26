require 'rails/all'
require_relative '../../app/modules/geographic_manager'

module GeographicManager
  
  class TestClient
  end

  class Polygon
  end
  
  context "Message module" do
    
    let(:client) {TestClient.new}
    let(:polygon) {Polygon.new}
    let(:lng) {'-119.417932399'}
    let(:lat) {'36.778261'}
    let(:point) {'-119.417932399, 36.778261'}

    it "validate points in polygon" do
      allow(GeographicManager).to receive(:get_point).with(lng, lat) { point }
      allow(GeographicManager).to receive(:get_polygon_california) {polygon}
      allow(polygon).to receive(:contains_point?).with(point) {true}
      GeographicManager.point_in_polygon(lng, lat)
    end
  end
end
