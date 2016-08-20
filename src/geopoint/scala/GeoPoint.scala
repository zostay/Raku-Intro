object GeoPoint(private val lat : Double, private val lon : Double) {
  require(lat <= 180 && lat >= -180)
  require(lon <= 180 && lon >= -180)

  def withLon(private val newlon) = {
    require(newlon <= 180 && newlon >= -180)
    GeoPoint.new(lat, newlon)
  }

  def withLat(private val newlat) = {
    require(newlat <= 180 && newlat >= -180)
    GeoPoint.new(newlat, lon)
  }

  def toString = {
    (if (lat >= 0) "N" + lat else "S" + -lat) + " " +
    (if (lon >= 0) "E" + lon else "W" + -lon)
  }
}
