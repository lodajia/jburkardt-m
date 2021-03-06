function ffmsh_io_test ( )

%*****************************************************************************80
%
%% FFMSH_IO_TEST tests the FFMSH_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 December 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFMSH_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FFMSH_IO library.\n' );

  ffmsh_io_test01 ( );
  ffmsh_io_test02 ( );
  ffmsh_io_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FFMSH_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
