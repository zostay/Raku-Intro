use v5.24;
use warnings;
package GeoPoint;

use overload '""' => \&gist;

sub Longitude {
    my ($lon) = @_;
    die "Not a valid longitude"
        unless $lon >= -180 and $lon <= 180;
    return $lon;
}

sub Latitude {
    my ($lat) = @_;
    die "Not a valid latitude"
        unless $lat >= -90 and $lat <= 90;
    return $lat;
}

sub new {
    my ($class, %o) = @_;
    my $lat = Latitude($o{lat});
    my $lon = Longitude($o{lon});
    bless { lat => $lat, lon => $lon }, $class;
}

sub lat {
    my $self = shift;
    if (@_) { $self->{lat} = shift }
    return $self->{lat};
}

sub lon {
    my $self = shift;
    if (@_) { $self->{lon} = shift }
    return $self->{lon};
}

sub gist {
    my $self = shift;
    return
        ($self->{lat} >= 0 ? "N$self->{lat}" : "S" . -$self->{lat}) . " " .
        ($self->{lon} >= 0 ? "E$self->{lon}" : "W" . -$self->{lon})
}

my $geo = GeoPoint->new(lat => 39.1915045, lon => -96.6070506);
say $geo->lat; # 39.1915045
say $geo->lon; # -96.6070506
say $geo;     # N39.1915045 W96.6070506
