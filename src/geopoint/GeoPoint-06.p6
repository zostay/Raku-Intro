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

constant $Earth-R := 3_959; # miles

sub deg2rad($deg) { ($deg / 180) * π }

sub hav($θ) { sin($θ / 2)² }

sub infix:<distance-to>(GeoPoint $a, GeoPoint $b) returns Num {
    my $Δlat = deg2rad($b.lat - $a.lat);
    my $Δlon = deg2rad($b.lon - $a.lon);

    my $h = hav($Δlat) + cos(deg2rad($a.lat)) * cos(deg2rad($b.lat)) * hav($Δlon);
    2 * $Earth-R * asin( sqrt( $h ) );
}

my $the-fellow = GeoPoint.new(lat => 39.1915045, lon => -96.6070506);
say $the-fellow.lat;
say $the-fellow.lon;
say $the-fellow;

my $radina's-bakehouse = GeoPoint.new(lat => 39.1747982, lon => -96.5594172);

say ($the-fellow distance-to $radina's-bakehouse).fmt("%.1f"), " miles";
