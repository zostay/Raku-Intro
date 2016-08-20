class GeoPoint {
    has $.lat is rw = 0;
    has $.lon is rw = 0;

    method gist {
        ($!lat >= 0 ?? "N$!lat" !! "S{-$!lat}") ~ " " ~
        ($!lon >= 0 ?? "E$!lon" !! "W{-$!lon}")
    }
}

my $geo = GeoPoint.new(lat => 39.1915045);
$geo.lon = "Tuesday";
say $geo.lat; # 39.1915045
say $geo.lon; # Tuesday
say $geo;     # UH OH
