function triangle_monte_carlo_test ( )

%*****************************************************************************80
%
%% TRIANGLE_MONTE_CARLO_TEST tests the TRIANGLE_MONTE_CARLO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGLE_MONTE_CARLO library.\n' );

  triangle_monte_carlo_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONTE_CARLO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
