use v6;

subset Longitude of Rat where 180 >= * >= -180;
subset Latitude of Rat where 90 >= * >= -90;
class GeoPoint {
    has Latitude $.lat is rw is required;
    has Longitude $.lon is rw is required;

    method gist {
        ($!lat >= 0 ?? "N$!lat" !! "S{-$!lat}") ~ " " ~
        ($!lon >= 0 ?? "E$!lon" !! "W{-$!lon}")
    }

    method Str { self.gist }
}

class PlaceName {
    has GeoPoint $.loc;
    has Str $.name;

    method gist { sprintf "%-25s: %s", $.name, $.loc }
}

my $geo = q:to/EOGEO/;
N39.1915045 W96.6070506 The Fellow
39°11'24.8"N 96°35'03.2"W Engineering Hall
39.192508, -96.608072 Radina's on the Hill
EOGEO

grammar GeoName {
    rule TOP { <lat> ","? <lon> <name> }

    proto rule lat { * }
    token lat:sym<plat>  { <sign> <number> }
    token lat:sym<nslat> { <ns> <number> }
    token lat:sym<latns> { <deg> <min> <sec> <ns> }

    proto rule lon { * }
    token lon:sym<plon>  { <sign> <number> }
    token lon:sym<welon> { <we> <number> }
    token lon:sym<lonwe> { <deg> <min> <sec> <we> }

    token ns { <[NS]> }
    token we { <[WE]> }

    token name { .* }

    token deg { <integer> '°' }
    token min { <integer> "'" }
    token sec { <number> '"' }

    token sign       { "-"? }
    token number     { \d+ '.' \d+ }
    token integer    { \d+ }
}

class GeoReader {
    method TOP($/) {
        make PlaceName.new(
            name => $<name>.made,
            loc  => GeoPoint.new(
                lat => $<lat>.made,
                lon => $<lon>.made,
            ),
        );
    }

    method lat:sym<plat>($/)    { make $<number>.made * $<sign>.made }
    method lat:sym<nslat>($/)   { make $<number>.made * $<ns>.made }
    method lat:sym<latns>($/)   {
        make $<ns>.made * [+] ($<deg>, $<min>, $<sec>).map(*.made)
    }

    method lon:sym<plon>($/)    { make $<number>.made * $<sign>.made }
    method lon:sym<welon>($/)   { make $<number>.made * $<we>.made }
    method lon:sym<lonwe>($/)   {
        make $<we>.made * [+] ($<deg>, $<min>, $<sec>).map(*.made)
    }

    method ns($/)      { make $/ eq "N" ?? 1 !! -1 }
    method we($/)      { make $/ eq "W" ?? 1 !! -1 }

    method name($/)    { make ~$/ }

    method deg($/)     { make $<integer>.made }
    method min($/)     { make $<integer>.made / 60 }
    method sec($/)     { make $<number>.made / 360 }

    method sign($/)    { make $/ eq "-" ?? -1 !! 1 }
    method number($/)  { make $/.Rat }
    method integer($/) { make $/.Int }
}

for $geo.lines -> $line {
    my $place = GeoName.parse($line, actions => GeoReader).made;
    say $place;
}
