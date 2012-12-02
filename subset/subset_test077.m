function subset_test077 ( )

%*****************************************************************************80
%
%% TEST077 tests KSUB_RANDOM3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  k = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST077\n' );
  fprintf ( 1, '  KSUB_RANDOM3 generates a random K-subset of an N-set.\n' );
  fprintf ( 1, '  Set size is N =    %d\n', n );
  fprintf ( 1, '  Subset size is K = %d\n', k );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 10
    [ a, seed ] = ksub_random3 ( n, k, seed );
    for j = 1 : n
      fprintf ( 1, '  %3d', a(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end