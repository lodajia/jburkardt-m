function test_values_test1465 ( )

%*****************************************************************************80
%
%% TEST1465 demonstrates the use of THREE_J_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1465:\n' );
  fprintf ( 1, '  THREE_J_VALUES returns values of \n' );
  fprintf ( 1, '  the Wigner 3J coefficient.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '      J1      J2      J3      M1      M2      M3        THREE_J\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, j1, j2, j3, m1, m2, m3, fx ] = three_j_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %6.2f  %24.16f\n', ...
      j1, j2, j3, m1, m2, m3, fx );

  end

  return
end