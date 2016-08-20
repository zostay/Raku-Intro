class GeoPoint {
    has $.lat is rw = 0;
    has $.lon is rw = 0;
}

my $geo = GeoPoint.new(lat => 5);
$geo.lon = 12;
say $geo.lat; # 5
say $geo.lon; # 12
say $geo;     # GeoPoint.new(lat => 5, lon => 12)
