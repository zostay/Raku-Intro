use v5.24;
use warnings;
package GeoPoint;
use Moose;

use overload '""' => \&gist;

use Moose::Util::TypeConstraints;
subtype 'Longitude', as 'Num', where { $_ >= -180 and $_ <= 180 };
subtype 'Latitude', as 'Num', where { $_ >= -90 and $_ <= 90 };
no Moose::Util::TypeConstraints;

has lat => (
    is          => 'rw',
    isa         => 'Latitude',
    required    => 1,
);

has lon => (
    is          => 'rw',
    isa         => 'Longitude',
    required    => 1,
);

sub gist {
    my $self = shift;
    return
        ($self->lat >= 0 ? "N" . $self->lat : "S" . -$self->{lat}) . " " .
        ($self->lon >= 0 ? "E" . $self->lon : "W" . -$self->{lon})
}

my $geo = GeoPoint->new(lat => 39.1915045, lon => -96.6070506);
say $geo->lat; # 39.1915045
say $geo->lon; # -96.6070506
say $geo;     # N39.1915045 W96.6070506
