object Main {
  def main(args: Array[String]): Unit = {
    GeoPoint geo = GeoPoint.new(39.1915045, -96.6070506);
    println(geo.lat);
    println(geo.lon);
    println(geo);
  }
}
