subset Longitude of Rat where -180 <= * <= 180;
subset Latitude of Rat where -90 <= * <= 90;
class GeoPoint {
    has Latitude $.lat is rw = 0;
    has Longitude $.lon is rw = 0;

    method gist {
        ($!lat >= 0 ?? "N$!lat" !! "S{-$!lat}") ~ " " ~
        ($!lon >= 0 ?? "E$!lon" !! "W{-$!lon}")
    }
}

my $geo = GeoPoint.new(lat => 39.1915045);
$geo.lon = "Tuesday"; # Type Check Error!
