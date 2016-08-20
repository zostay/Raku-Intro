subset Longitude of Rat where 180 >= * >= -180;
subset Latitude of Rat where 90 >= * >= -90;
class GeoPoint {
    has Latitude $.lat is rw is required;
    has Longitude $.lon is rw is required;

    method gist {
        ($!lat >= 0 ?? "N$!lat" !! "S{-$!lat}") ~ " " ~
        ($!lon >= 0 ?? "E$!lon" !! "W{-$!lon}")
    }
}

my $geo = GeoPoint.new(lat => 39.1915045, lon => -96.6070506);
say $geo.lat; # 39.1915045
say $geo.lon; # -96.6070506
say $geo;     # N39.1915045 W96.6070506
