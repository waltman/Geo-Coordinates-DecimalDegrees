# $Id$

use strict;
use Test::More tests => 56;

BEGIN { use_ok('Geo::Coordinates::DecimalDegrees') }

is( dms2decimal( 0,  0,  0),   0);
is( dms2decimal( 1,  0,  0),   1);
is( dms2decimal(-1,  0,  0), -1);
is( dms2decimal( 1, 15,  0),  1.25);
is( dms2decimal( 1, 30,  0),  1.5);
is( dms2decimal( 1, 45,  0),  1.75);
is( dms2decimal(-1, 15,  0), -1.25);
is( dms2decimal(-1, 30,  0), -1.5);
is( dms2decimal(-1, 45,  0), -1.75);
is( dms2decimal( 0,  0, 15),  0.00416666666666667);
is( dms2decimal( 0,  0, 30),  0.00833333333333333);
is( dms2decimal( 0,  0, 45),  0.0125);
is( dms2decimal( 0, 15, 15),  0.25416666666666667);
is( dms2decimal( 0, 30, 30),  0.50833333333333333);
is( dms2decimal( 0, 45, 45),  0.7625);
is( dms2decimal( 1, 15, 15),  1.25416666666666667);
is( dms2decimal( 1, 30, 30),  1.50833333333333333);
is( dms2decimal( 1, 45, 45),  1.7625);

is( dm2decimal( 0,  0),      0);
is( dm2decimal( 1,  0),      1);
is( dm2decimal(-1,  0),     -1);
is( dm2decimal( 1, 15),      1.25);
is( dm2decimal( 1, 30),      1.5);
is( dm2decimal( 1, 45),      1.75);
is( dm2decimal(26, 21.804), 26.3634);
is( dm2decimal(80,  8.952), 80.1492);

is_deeply( [decimal2dms(  0 )],                   [ 0,  0,  0]);
is_deeply( [decimal2dms(  1 )],                   [ 1,  0,  0]);
is_deeply( [decimal2dms( -1 )],                   [-1,  0,  0]);
is_deeply( [decimal2dms(  1.25 )],                [ 1, 15,  0]);
is_deeply( [decimal2dms(  1.5 )],                 [ 1, 30,  0]);
is_deeply( [decimal2dms(  1.75 )],                [ 1, 45,  0]);
is_deeply( [decimal2dms( -1.25 )],                [-1, 15,  0]);
is_deeply( [decimal2dms( -1.5 )],                 [-1, 30,  0]);
is_deeply( [decimal2dms( -1.75 )],                [-1, 45,  0]);
is_deeply( [decimal2dms(  0.00416666666666667 )], [ 0,  0, 15]);
is_deeply( [decimal2dms(  0.00833333333333333 )], [ 0,  0, 30]);
is_deeply( [decimal2dms(  0.0125 )],              [ 0,  0, 45]);
is_deeply( [decimal2dms(  0.25416666666666667 )], [ 0, 15, 15]);
is_deeply( [decimal2dms(  0.50833333333333333 )], [ 0, 30, 30]);
is_deeply( [decimal2dms(  0.7625 )],              [ 0, 45, 45]);
is_deeply( [decimal2dms(  1.25416666666666667 )], [ 1, 15, 15]);
is_deeply( [decimal2dms(  1.50833333333333333 )], [ 1, 30, 30]);
is_deeply( [decimal2dms(  1.7625, )],             [ 1, 45, 45]);

is_deeply( [decimal2dm(  0 )],     [ 0,  0]);
is_deeply( [decimal2dm(  1 )],     [ 1,  0]);
is_deeply( [decimal2dm( -1 )],     [-1,  0]);
is_deeply( [decimal2dm(  1.25 )],  [ 1, 15]);
is_deeply( [decimal2dm(  1.5 )],   [ 1, 30]);
is_deeply( [decimal2dm(  1.75 )],  [ 1, 45]);
is_deeply( [decimal2dm( -1.25 )],  [-1, 15]);
is_deeply( [decimal2dm( -1.5 )],   [-1, 30]);
is_deeply( [decimal2dm( -1.75 )],  [-1, 45]);
is_deeply( [decimal2dm( 26.3634)], [26, 21.8039999999999]);
is_deeply( [decimal2dm( 80.1492)], [80,  8.9519999999996]);
