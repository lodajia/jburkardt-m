function fd1d_heat_explicit_test01 ( )

%*****************************************************************************80
%
%% FD1D_HEAT_EXPLICIT_TEST01 does a simple test problem
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 November 2014    
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_HEAT_EXPLICIT_TEST01:\n' );
  fprintf ( 1, '  Compute an approximate solution to the time-dependent\n' );
  fprintf ( 1, '  one dimensional heat equation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    dH/dt - K * d2H/dx2 = f(x,t)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Run a simple test case.\n' );
%
%  Heat coefficient.
%
  k = k_test01 ( );
%
%  X_NUM is the number of equally spaced nodes to use between 0 and 1.
%
  x_num = 21;
  x_min = 0.0;
  x_max = 1.0;
  dx = ( x_max - x_min ) / ( x_num - 1 );
  x = linspace ( x_min, x_max, x_num );
%
%  T_NUM is the number of equally spaced time points between 0 and 10.0.
%
  t_num = 201;
  t_min = 0.0;
  t_max = 80.0;
  dt = ( t_max - t_min ) / ( t_num - 1 );
  t = linspace ( t_min, t_max, t_num );
%
%  Get the CFL coefficient.
%
  cfl = fd1d_heat_explicit_cfl ( k, t_num, t_min, t_max, x_num, x_min, x_max );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of X nodes = %d\n', x_num );
  fprintf ( 1, '  X interval is [%f,%f]\n', x_min, x_max );
  fprintf ( 1, '  X spacing is %f\n', dx );
  fprintf ( 1, '  Number of T values = %d\n', t_num );
  fprintf ( 1, '  T interval is [%f,%f]\n', t_min, t_max );
  fprintf ( 1, '  T spacing is %f\n', dt );
  fprintf ( 1, '  Constant K = %g\n', k );
  fprintf ( 1, '  CFL coefficient = %g\n', cfl );
%
%  Running the code produces an array H of temperatures H(t,x),
%  and vectors x and t.
%
  hmat = zeros ( x_num, t_num );

  for j = 1 : t_num
    if ( j == 1 )
      h = ic_test01 ( x_num, x, t(j) );
      h = bc_test01 ( x_num, x, t(j), h );
    else
      h = fd1d_heat_explicit ( x_num, x, t(j-1), dt, cfl, @rhs_test01, @bc_test01, h );
    end
    hmat(1:x_num,j) = h(1:x_num);
  end
%
%  Plot the data.
%
  figure ( 1 )
  [ tmat, xmat ] = meshgrid ( t, x )
  mesh ( tmat, xmat, hmat )
  title ( 'H(X,T) for TEST01 computed by FD1D\_HEAT\_EXPLICIT' );
  xlabel ( '<-- Time -->' );
  ylabel ( '<-- X -->' );
  zlabel ( '<--  H(X,T) -->' );
%
%  Write the data to files.
%
  r8mat_write ( 'h_test01.txt', x_num, t_num, hmat );
  r8vec_write ( 't_test01.txt', t_num, t );
  r8vec_write ( 'x_test01.txt', x_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  H(X,T) written to "h_test01.txt"\n' );
  fprintf ( 1, '  T values written to "t_test01.txt"\n' );
  fprintf ( 1, '  X values written to "x_test01.txt"\n' );

  return
end
