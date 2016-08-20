class GeoPoint
    def check_lat(lat)
        unless lat <= 180 and lat >= -180
            raise ArgumentError, 'not a correct latitude' 
        end
    end

    def check_lon(lon)
        unless lon <= 180 and lon >= -180
            raise ArgumentError, 'not a correct longitude' 
        end
    end

    def initialize(lat, lon)
        check_lat(lat)
        check_lon(lon)
        @lat = lat
        @lon = lon
    end

    def lat
        @lat
    end

    def lat=(newlat)
        check_lat(newlat)
        @lat = newlat
    end

    def lon
        @lon
    end

    def lon=(newlon)
        check_lon(newlon)
        @lon = newlon
    end

    def to_str
        (@lat >= 0 ? "N" + @lat.to_s : "S" + (-@lat).to_s) + " " +
        (@lon >= 0 ? "E" + @lon.to_s : "W" + (-@lon).to_s)
    end
end

geo = GeoPoint.new(39.1915045, -96.6070506)
puts geo.lat
puts geo.lon
puts geo.to_str
