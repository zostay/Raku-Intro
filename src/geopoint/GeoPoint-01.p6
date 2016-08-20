class GeoPoint {
    has $.lat = 0;
    has $.lon = 0;
}

my $geo = GeoPoint.new(lat => 5);
say $geo.lat; # 5
say $geo.lon; # 0
say $geo;     # GeoPoint.new(lat => 5, lon => 0)
