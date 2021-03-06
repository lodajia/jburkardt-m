function i4vec_sort_heap_d_test ( )

%*****************************************************************************80
%
%% I4VEC_SORT_HEAP_D_TEST tests I4VEC_SORT_HEAP_D.
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
  n = 20;
  b = 0;
  c = 3 * n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_SORT_HEAP_D_TEST\n' );
  fprintf ( 1, '  For a vector of integers,\n' );
  fprintf ( 1, '  I4VEC_SORT_HEAP_D descending sorts.\n' );

  seed = 123456789;

  [ a, seed ] = i4vec_uniform_ab ( n, b, c, seed );

  i4vec_print ( n, a, '  Unsorted:' );

  a = i4vec_sort_heap_d ( n, a );

  i4vec_print ( n, a, '  Descending sorted:' );

  return
end
