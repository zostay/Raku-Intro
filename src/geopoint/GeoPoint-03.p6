class GeoPoint {
    has $.lat is rw = 0;
    has $.lon is rw = 0;

    method gist {
        ($!lat >= 0 ?? "N$!lat" !! "S{-$!lat}") ~ " " ~
        ($!lon >= 0 ?? "E$!lon" !! "W{-$!lon}")
    }
}

my $geo = GeoPoint.new(lat => 39.1915045);
$geo.lon = -96.6070506;
say $geo.lat; # 39.1915045
say $geo.lon; # -96.6070506
say $geo;     # N39.1915045 W96.6070506
