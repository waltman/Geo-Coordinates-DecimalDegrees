package Geo::Coordinates::DecimalDegrees;

require Exporter;
require Carp;

@ISA = qw(Exporter);

@EXPORT = qw( decimal2dms dms2decimal );

$VERSION = '0.01';

use strict;
use warnings;

sub decimal2dms {
    my ($decimal) = @_;

    my $degrees = int($decimal);

    # convert decimal part to seconds
    $decimal = abs($decimal - $degrees) * 3600;
    my $minutes = int($decimal / 60);
    my $seconds = $decimal - ($minutes * 60);

    return ($degrees, $minutes, $seconds);
}

sub dms2decimal {
    my ($degrees, $minutes, $seconds) = @_;
    my $decimal;

    if ($degrees >= 0) {
	$decimal = $degrees + $minutes/60 + $seconds/3600;
    } else {
	$decimal = $degrees - $minutes/60 - $seconds/3600;
    }

    return $decimal;
}

1;

=head1 NAME

Geo::Coordinates::DecimalDegrees - convert between
degrees/minutes/seconds and decimal degrees

=head1 SYNOPSIS

  use Geo::Coordinates::DecimalDegrees;
  (degrees, $minutes, $seconds) = decimal2dms($decimal_degrees);
  $decimal_degrees = dms2decimal($degrees, $minutes, $seconds);

=head1 DESCRIPTION

Latitudes and longitudes are most often presented in two common
formats: decimal degrees, and degrees, minutes and seconds.  There are
60 minutes in a degree, and 60 seconds in a minute.  In decimal
degrees, the minutes and seconds are presented as a fractional number
of degrees.  For example, 1 degree 30 minutes is 1.5 degrees, and 30
minutes 45 seconds is 0.5125 degrees.

This module provides functions for converting between these two
formats.

=head1 FUNCTIONS

This module provides the following functions, which are all exported
by default when you call C<use Geo::Coordinates::DecimalDegrees;>.

=over 4

=item decimal2dms($decimal_degrees)

Converts a floating point number of degrees to the equivalent number
of degrees, minutes, and seconds, which are returned as a 3-element
list.  Typically used as follows:

  ($degrees, $minutes, $seconds) = decimal2dms($decimal_degrees);

If $decimal_degrees is negative, only $degrees will be negative.
$minutes and $seconds will always be positive.

=item dms2decimal($degrees, $minutes, $seconds)

Converts degrees, minutes, and seconds to the equivalent number of
decimal degrees:

  $decimal_degrees = dms2decimal($degrees, $minutes, $seconds);

If $degrees is negative, then $decimal_degrees will also be negative.

=back

=head1 CAVEATS

The functions don't do any sanity checks on their arguments.  If you
have a good reason to convert 61 minutes -101 seconds to decimal, go
right ahead.

=head1 AUTHOR

Walt Mankowski, E<lt>waltman@pobox.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Walt Mankowski

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
