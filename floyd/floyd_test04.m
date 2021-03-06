function floyd_test04 ( )

%*****************************************************************************80
%
%% FLOYD_TEST04 uses Floyd's method for a triangulation.
%
%  Discussion:
%
%     8  41--42--43--44  45--46--47--48
%     |   | \ | \ | \ |   | \ | \ | \ |
%     7  33--34--35--36  37--38--39--40
%     |   | \ |                   | \ |
%     6  29--30                  31--32
%     |   | \ |                   | \ |
%     5  25--26                  27--28
%     |   | \ |                   | \ |
%     4  21--22                  23--24
%     |   | \ |                   | \ |
%     3  17--18                  19--20
%     |   | \ |                   | \ |
%     2   9--10--11--12--13--14--15--16
%     |   | \ | \ | \ | \ | \ | \ | \ |
%     1   1---2---3---4---5---6---7---8
%     |    
%     +---1---2---3---4---5---6---7---8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2014
%
%  Author:
%
%    John Burkardt
%
  element_num = 46;
  node_num = 48;
  
  element_node = [ ...
     1,  2,  9; ...
     2, 10,  9; ...
     2,  3, 10; ...
     3, 11, 10; ...
     3,  4, 11; ...
     4, 12, 11; ...
     4,  5, 12; ...
     5, 13, 12; ...
     5,  6, 13; ...
     6, 14, 13; ...
     6,  7, 14; ...
     7, 15, 14; ...
     7,  8, 15; ...
     8, 16, 15; ...
     9, 10, 17; ...
    10, 18, 17; ...
    15, 16, 19; ...
    16, 20, 19; ...
    17, 18, 21; ...
    18, 22, 21; ...
    19, 20, 23; ...
    20, 24, 23; ...
    21, 22, 25; ...
    22, 26, 25; ...
    23, 24, 27; ...
    24, 28, 27; ...
    25, 26, 29; ...
    26, 30, 29; ...
    27, 28, 31; ...
    28, 32, 31; ...
    29, 30, 33; ...
    30, 34, 33; ...
    31, 32, 39; ...
    32, 40, 39; ...
    33, 34, 41; ...
    34, 42, 41; ...
    34, 35, 42; ...
    35, 43, 42; ...
    35, 36, 43; ...
    36, 44, 43; ...
    37, 38, 45; ...
    38, 46, 45; ...
    38, 39, 46; ...
    39, 47, 46; ...
    39, 40, 47; ...
    40, 48, 47 ]';
  xy = [ ...
    1.0, 1.0; ...
    2.0, 1.0; ...
    3.0, 1.0; ...
    4.0, 1.0; ...
    5.0, 1.0; ...
    6.0, 1.0; ...
    7.0, 1.0; ...
    8.0, 1.0; ...
    1.0, 2.0; ...
    2.0, 2.0; ...
    3.0, 2.0; ...
    4.0, 2.0; ...
    5.0, 2.0; ...
    6.0, 2.0; ...
    7.0, 2.0; ...
    8.0, 2.0; ...
    1.0, 3.0; ... 
    2.0, 3.0; ...
    7.0, 3.0; ...
    8.0, 3.0; ...
    1.0, 4.0; ...
    2.0, 4.0; ...
    7.0, 4.0; ...
    8.0, 4.0; ...
    1.0, 5.0; ...
    2.0, 5.0; ...
    7.0, 5.0; ...
    8.0, 5.0; ...
    1.0, 6.0; ...
    2.0, 6.0; ...
    7.0, 6.0; ...
    8.0, 6.0; ...
    1.0, 7.0; ...
    2.0, 7.0; ...
    3.0, 7.0; ...
    4.0, 7.0; ...
    5.0, 7.0; ...
    6.0, 7.0; ...
    7.0, 7.0; ...
    8.0, 7.0; ...
    1.0, 8.0; ... 
    2.0, 8.0; ...
    3.0, 8.0; ...
    4.0, 8.0; ...
    5.0, 8.0; ...
    6.0, 8.0; ...
    7.0, 8.0; ...
    8.0, 8.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FLOYD_TEST04\n' );
  fprintf ( 1, '  Start with a triangulation, and use R8_FLOYD\n' );
  fprintf ( 1, '  to determine the pairwise distance matrix.\n' );
%
%  Must initialize distances to -1.
%
  d(1:node_num,1:node_num) = -1.0;
%
%  Diagonals are 0.
%
  for i = 1 : node_num
    d(i,i) = 0.0;
  end
%
%  Initialize D to the one-step distance.
%
  for element = 1 : element_num
    n1 = element_node(3,element);
    for i = 1 : 3
      n2 = element_node(i,element);
      d(n1,n2) = norm ( xy(1:2,n1) - xy(1:2,n2) );
      d(n2,n1) = d(n1,n2);
      n1 = n2;
    end
  end
%
%  Reset -1 values to R8_HUGE.
%
  i = find ( d(1:node_num,1:node_num) == - 1.0 );
  d(i) = Inf;
%
%  Update D to the N-1 step distance.
%
  d = r8mat_floyd ( node_num, d );

  r8mat_print ( node_num, node_num, d, '  Distance matrix' );
%
%  We can plot the distance function over the triangulated region.
%
  base = 20;
  trisurf ( element_node', xy(1,:), xy(2,:), d(base,:), ...
    'FaceColor', 'interp', ...
    'EdgeColor', 'k' );
  view ( 2 );
  title ( sprintf ( 'Distance from node %d', base ) );
  filename = 'floyd_test04.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving graphics files as "%s"\n', filename );

  return
end

