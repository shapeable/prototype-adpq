module GeographicManager

    def self.point_in_polygon(lng, lat)
        point   = get_point(lng, lat)
        polygon = get_polygon_california
       puts  polygon.contains_point?(point)
    end

    private 
    def self.get_point(lng, lat)
      GeoRuby::SimpleFeatures::Point.from_x_y(lng, lat)
    end

    def self.get_polygon_california
        hash = YAML.load(File.read("#{Rails.root}/app/modules/states/california.yml"))
        GeoRuby::SimpleFeatures::Polygon.from_coordinates(hash,4326)
    end
    
end