# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

use strict;
use Test::More tests => 37;

BEGIN { use_ok('Geo::Coordinates::DecimalDegrees') }

is( dms2decimal(0, 0, 0),      0   );
is( dms2decimal(1, 0, 0),      1   );
is( dms2decimal(-1, 0, 0),    -1   );
is( dms2decimal(1, 15, 0),   1.25 );
is( dms2decimal(1, 30, 0),   1.5 );
is( dms2decimal(1, 45, 0),   1.75 );
is( dms2decimal(-1, 15, 0), -1.25 );
is( dms2decimal(-1, 30, 0), -1.5 );
is( dms2decimal(-1, 45, 0), -1.75 );
is( dms2decimal(0, 0, 15),  0.00416666666666667 );
is( dms2decimal(0, 0, 30),  0.00833333333333333 );
is( dms2decimal(0, 0, 45),  0.0125 );
is( dms2decimal(0, 15, 15),  0.25416666666666667 );
is( dms2decimal(0, 30, 30),  0.50833333333333333 );
is( dms2decimal(0, 45, 45),  0.7625 );
is( dms2decimal(1, 15, 15),  1.25416666666666667 );
is( dms2decimal(1, 30, 30),  1.50833333333333333 );
is( dms2decimal(1, 45, 45),  1.7625, );

is_deeply( [decimal2dms( 0 )], [0, 0, 0]);
is_deeply( [decimal2dms( 1 )], [1, 0, 0]);
is_deeply( [decimal2dms( -1 )], [-1, 0, 0]);
is_deeply( [decimal2dms( 1.25 )], [1, 15, 0]);
is_deeply( [decimal2dms( 1.5 )], [1, 30, 0]);
is_deeply( [decimal2dms( 1.75 )], [1, 45, 0]);
is_deeply( [decimal2dms( -1.25 )], [-1, 15, 0]);
is_deeply( [decimal2dms( -1.5 )], [-1, 30, 0]);
is_deeply( [decimal2dms( -1.75 )], [-1, 45, 0]);
is_deeply( [decimal2dms( 0.00416666666666667 )], [0, 0, 15]);
is_deeply( [decimal2dms( 0.00833333333333333 )], [0, 0, 30]);
is_deeply( [decimal2dms( 0.0125 )], [0, 0, 45]);
is_deeply( [decimal2dms( 0.25416666666666667 )], [0, 15, 15]);
is_deeply( [decimal2dms( 0.50833333333333333 )], [0, 30, 30]);
is_deeply( [decimal2dms( 0.7625 )], [0, 45, 45]);
is_deeply( [decimal2dms( 1.25416666666666667 )], [1, 15, 15]);
is_deeply( [decimal2dms( 1.50833333333333333 )], [1, 30, 30]);
is_deeply( [decimal2dms( 1.7625, )], [1, 45, 45]);

# is_deeply( [interval_raw(0)], [0, 0, 0, 0] );
# is_deeply( [interval_raw(1)], [0, 0, 0, 1] );
# is_deeply( [interval_raw(2)], [0, 0, 0, 2] );

# is_deeply( [interval_raw(MIN_SECS)], [0, 0, 1, 0] );
# is_deeply( [interval_raw(HOUR_SECS)], [0, 1, 0, 0] );
# is_deeply( [interval_raw(DAY_SECS)], [1, 0, 0, 0] );

# is_deeply( [interval_raw(MIN_SECS + 1)], [0, 0, 1, 1] );
# is_deeply( [interval_raw(MIN_SECS - 1)], [0, 0, 0, 59] );

# is_deeply( [interval_raw(HOUR_SECS + 1)], [0, 1, 0, 1] );
# is_deeply( [interval_raw(HOUR_SECS - 1)],  [0, 0, 59, 59] );

# is_deeply( [interval_raw(DAY_SECS + 1)], [1, 0, 0, 1] );
# is_deeply( [interval_raw(DAY_SECS - 1)], [0, 23, 59, 59] );

