def check_latitude(lat):
    if not -90 <= lat <= 90:
        raise Exception('invalid latitude')
    return lat
            
def check_longitude(lon):
    if not -180 <= lon <= 180:
        raise Exception('invalid longitude')
    return lon

class GeoPoint:
    def __init__(self, lat, lon):
        self.lat = check_latitude(lat)
        self.lon = check_longitude(lon)
        
    def gist(self):
        if self.lat >= 0:
            lat_dir = 'N'
        else:
            lat_dir = 'S'
            
        if self.lon >= 0:
            lon_dir = 'E'
        else:
            lon_dir = 'W'
            
        return "{}{} {}{}".format(lat_dir, abs(self.lat), lon_dir, abs(self.lon))
        
    def __str__(self):
        return self.gist()

geo = GeoPoint(39.1915045, -96.6070506);
print(geo.lat); # 39.1915045
print(geo.lon); # -96.6070506
print(geo);     # N39.1915045 W96.6070506
