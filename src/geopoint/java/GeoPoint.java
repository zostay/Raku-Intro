public class GeoPoint {
    private double lat;
    private double lon;
    
    public class GeoException extends IllegalArgumentException {
        public GeoException(String m) {
            super(m);
        }
    }
    
    public double checkLongitude(double lon) {
        if (lon < -180 || lon > 180) {
            throw new GeoException("not a correct longitude");
        }
        return lon;
    }
    
    public double checkLatitude(double lat) {
        if (lat < -90 || lat > 90) {
            throw new GeoException("not a correct longitude");
        }
        return lat;
    }
    
    public GeoPoint(double lat, double lon) {
        this.lat = checkLatitude(lat);
        this.lon = checkLongitude(lon);
    }
    
    public double getLat() { return this.lat; }
    public void setLat(double lat) { 
        this.lat = checkLatitude(lat); 
    }
    
    public double getLon() { return this.lon; }
    public void setLon(double lat) throws GeoException { 
        this.lon = checkLongitude(lon); 
    }
    
    public String toString() {
        return (lat >= 0 ? "N" + lat : "S" + -lat) + " " +
               (lon >= 0 ? "E" + lon : "W" + -lon);
    }
}
